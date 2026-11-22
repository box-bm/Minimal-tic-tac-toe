#!/usr/bin/env bash
# Computes the next semantic version from Conventional Commits since the last
# `v*` tag, and writes release notes for GitHub + Play Store changelogs.
#
# Rules (highest wins across ALL commits/PRs since the last tag):
#   major  -> `type!:` or `BREAKING CHANGE` in subject/body
#   minor  -> feat / feature
#   patch  -> anything else (fix, perf, refactor, chore, ...)
#
# First release (no `v*` tag yet): ships the version from pubspec.yaml
# as-is (no semver bump) with versionCode + 1, and generic Play notes.
#
# Env:
#   BUMP_OVERRIDE  auto | patch | minor | major | keep   (default: auto)
#                  keep = same versionName, versionCode + 1 (re-ship a version
#                  before it goes to production; Deploy moves its tag)
#   NOTES_FILE     GitHub release notes output   (default: release-notes.md)
#   PLAY_NOTES     Play changelog output         (default: play-changelog.txt)
# Outputs (key=value, also appended to $GITHUB_OUTPUT when set):
#   last_tag, has_changes, bump, version_name, version_code, tag
set -euo pipefail

BUMP_OVERRIDE="${BUMP_OVERRIDE:-auto}"
NOTES_FILE="${NOTES_FILE:-release-notes.md}"
PLAY_NOTES="${PLAY_NOTES:-play-changelog.txt}"
PLAY_LIMIT=500

# pubspec.yaml holds the LAST DEPLOYED version as `version: X.Y.Z+BUILD`.
# BUILD is the Android versionCode and must only ever increase.
PUBSPEC_VERSION="$(sed -n 's/^version:[[:space:]]*//p' pubspec.yaml | head -1 | tr -d '[:space:]')"
CUR_NAME="${PUBSPEC_VERSION%%+*}"
CUR_CODE="${PUBSPEC_VERSION#*+}"
[[ "$CUR_NAME" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ && "$CUR_CODE" =~ ^[0-9]+$ ]] || {
  echo "::error::pubspec.yaml version must look like X.Y.Z+BUILD (got '$PUBSPEC_VERSION')" >&2; exit 1; }

LAST_TAG="$(git describe --tags --match 'v[0-9]*' --abbrev=0 2>/dev/null || true)"
RANGE="${LAST_TAG:+$LAST_TAG..}HEAD"

# Records separated by \x1e, fields by \x1f; skip bot release commits.
LOG="$(git log --no-merges --format='%s%x1f%b%x1e' "$RANGE" --invert-grep --grep='\[skip ci\]' || true)"
MERGE_LOG="$(git log --merges --format='%b%x1e' "$RANGE" || true)"

TYPE_RE='^([A-Za-z]+)(\([^)]*\))?(!)?:[[:space:]]*(.+)$'
bump="patch"; count=0
declare -a FEATS=() FIXES=() BREAKING=() OTHERS=()
declare -A SEEN=()

classify() {
  local line="$1" type scope bang desc key
  [[ "$line" =~ $TYPE_RE ]] || return 0
  type="${BASH_REMATCH[1],,}"; bang="${BASH_REMATCH[3]}"; desc="${BASH_REMATCH[4]}"
  key="${desc,,}"; [[ -n "${SEEN[$key]:-}" ]] && return 0; SEEN[$key]=1
  desc="${desc^}"
  if [[ -n "$bang" ]]; then bump="major"; BREAKING+=("$desc"); fi
  case "$type" in
    feat|feature) [[ "$bump" == "major" ]] || bump="minor"; FEATS+=("$desc") ;;
    fix|bugfix|perf) FIXES+=("$desc") ;;
    *) OTHERS+=("$type: $desc") ;;
  esac
}

while IFS= read -r -d $'\x1e' rec; do
  rec="${rec#$'\n'}"; [[ -z "$rec" ]] && continue
  count=$((count + 1))
  subject="${rec%%$'\x1f'*}"; body="${rec#*$'\x1f'}"
  classify "$subject"
  if grep -q 'BREAKING[ -]CHANGE' <<< "$subject$body"; then
    bump="major"; BREAKING+=("$(grep -m1 -oP 'BREAKING[ -]CHANGE:?\s*\K.*' <<< "$body" || echo "$subject")")
  fi
done <<< "$LOG"

# PR titles live in merge commit bodies (e.g. "Feature: onboarding improvements")
while IFS= read -r -d $'\x1e' rec; do
  while IFS= read -r line; do classify "$line"; done <<< "$rec"
done <<< "$MERGE_LOG"

[[ "$BUMP_OVERRIDE" != "auto" ]] && bump="$BUMP_OVERRIDE"

has_changes=true
initial=false
if [[ "$BUMP_OVERRIDE" == "keep" ]]; then
  # Explicit rebuild of the current versionName: always a new build, even with no commits.
  NEW_NAME="$CUR_NAME"; NEW_CODE=$((CUR_CODE + 1))
elif [[ -z "$LAST_TAG" && "$BUMP_OVERRIDE" == "auto" ]]; then
  # No previous tag: first release of the current versionName.
  initial=true; bump="initial"
  NEW_NAME="$CUR_NAME"; NEW_CODE=$((CUR_CODE + 1))
elif [[ $count -eq 0 ]]; then
  has_changes=false
  NEW_NAME="$CUR_NAME"; NEW_CODE="$CUR_CODE"; bump="none"
else
  IFS='.' read -r MA MI PA <<< "$CUR_NAME"
  case "$bump" in
    major) MA=$((MA + 1)); MI=0; PA=0 ;;
    minor) MI=$((MI + 1)); PA=0 ;;
    patch) PA=$((PA + 1)) ;;
  esac
  NEW_NAME="$MA.$MI.$PA"; NEW_CODE=$((CUR_CODE + 1))
fi

# ── GitHub release notes (markdown) ──
{
  section() { local t="$1"; shift; [[ $# -gt 0 ]] || return 0; echo "### $t"; printf -- '- %s\n' "$@"; echo; }
  section "⚠️ Breaking changes" "${BREAKING[@]}"
  section "✨ Features" "${FEATS[@]}"
  section "🐛 Fixes" "${FIXES[@]}"
  section "🔧 Other" "${OTHERS[@]}"
  [[ -n "$LAST_TAG" && "$LAST_TAG" != "v$NEW_NAME" ]] && echo "**Full changelog:** \`$LAST_TAG...v$NEW_NAME\`"
} > "$NOTES_FILE"

# ── Play Store changelog (plain text, user-facing, <= 500 chars) ──
# First release: whole history isn't "what's new" -> fall back to default.txt
[[ "$initial" == true ]] && FEATS=() FIXES=() BREAKING=()
{
  for l in "${BREAKING[@]}" "${FEATS[@]}"; do echo "• $l"; done
  for l in "${FIXES[@]}"; do echo "• Fix: $l"; done
} > "$PLAY_NOTES"
[[ -s "$PLAY_NOTES" ]] || echo "Bug fixes and performance improvements." > "$PLAY_NOTES"
if [[ $(wc -m < "$PLAY_NOTES") -gt $PLAY_LIMIT ]]; then
  head -c $((PLAY_LIMIT - 4)) "$PLAY_NOTES" | sed '$d' > "$PLAY_NOTES.tmp"
  echo "• …" >> "$PLAY_NOTES.tmp"; mv "$PLAY_NOTES.tmp" "$PLAY_NOTES"
fi

{
  echo "last_tag=$LAST_TAG"
  echo "has_changes=$has_changes"
  echo "bump=$bump"
  echo "version_name=$NEW_NAME"
  echo "version_code=$NEW_CODE"
  echo "tag=v$NEW_NAME"
} | tee -a "${GITHUB_OUTPUT:-/dev/null}"
