# Minimal Tic Tac Toe — working guide

Flutter app (Android/iOS/web/desktop). Code in `lib/`, tests in `test/`. Android releases go to Google Play via fastlane (`android/fastlane`).

## Golden rules

- **Never commit or push to `main` directly** (ruleset "Block Main"). Every change goes through a branch + PR.
- **Never edit the `version:` line in `pubspec.yaml` by hand, and never create `v*` tags or GitHub releases manually.**
  The **Deploy** workflow owns versioning. `pubspec.yaml` always holds the *last deployed* `X.Y.Z+BUILD`.
- The **PR title is the release input**: it lands in the merge commit and decides the version bump,
  so it must be a Conventional Commit. Use `ci:`/`chore:` for pipeline work so it doesn't show up as a user-facing fix.
- Don't commit secrets: `*.jks`, `key.properties`, `service_account_key.json`.

## Conventional Commits → version bump

Format: `type(optional-scope)!: description`. Allowed types:
`feat|feature|fix|bugfix|perf|refactor|chore|docs|test|build|ci|style|revert`.

| PR title / commit | Bump |
|---|---|
| `feat!: …` / any `type!:` / `BREAKING CHANGE:` in body | **major** |
| `feat: …` / `feature: …` | **minor** |
| anything else (`fix`, `perf`, `refactor`, `chore`, …) | **patch** |

The highest bump across all commits/PRs since the last `v*` tag wins.
`feat` and `fix` descriptions become the Play Store "What's new" text, so write them for users.

## Workflows (`.github/workflows/`)

| Workflow | Trigger | What it does |
|---|---|---|
| **PR Checks** (`pr-tests.yml`) | PR opened / updated / title edited | Validates the PR title, reports the version impact, runs `flutter analyze` + `flutter test`. |
| **Deploy** (`deploy.yml`) | manual, from `main` only | Computes the next version (`.github/scripts/next-version.sh`), writes `version: X.Y.Z+BUILD` to `pubspec.yaml` + Play changelogs, builds the AAB, commits `chore(release): vX.Y.Z (build N) [skip ci]` to `main` (the ruleset bypass list includes GitHub Actions), tags `vX.Y.Z`, uploads to Play **internal**, creates a **draft** GitHub release. |
| **Publish Release** (`publish-release.yml`) | manual | After promoting the build to production in Play Console, publishes the draft release and marks it **Latest**. |

### Releasing

1. Merge the PRs to ship into `main`.
2. Run Deploy: `gh workflow run deploy.yml --ref main` (optional `-f bump=auto|patch|minor|major|keep`). Watch with `gh run watch`, then `git pull` on `main` (it pushes the release commit).
3. Test the internal build, promote it to production in Play Console.
4. Run Publish Release: `gh workflow run publish-release.yml` (optionally `-f tag=vX.Y.Z`).

Notes:
- Tags are `vX.Y.Z` only (no `+build`). The build number lives in `pubspec.yaml` and the release title.
- `bump=keep` re-ships the current version as a new build (`BUILD + 1`) and moves its tag. Never on a version already in production.
- The build number is the Android `versionCode`: it must only ever increase (Play rejects lower or reused codes).
- Override the generated Play changelog (e.g. translated) by committing
  `android/fastlane/metadata/android/<locale>/changelogs/<BUILD>.txt` in a PR before deploying.

## Required repository secrets

`ANDROID_UPLOAD_SIGNATURE`, `KEYSTORE_KEY_ALIAS`, `KEYSTORE_KEY_PASSWORD`, `KEYSTORE_STORE_PASSWORD`, `PLAY_CONFIG_JSON` (base64-encoded where the workflows `base64 -d` them).
