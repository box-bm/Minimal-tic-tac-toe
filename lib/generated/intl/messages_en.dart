// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(playerName) => "${playerName} color";

  static String m1(playerName) => "${playerName} icon";

  static String m2(playerNumber) => "Player ${playerNumber}";

  static String m3(playerName) => "Winner: ${playerName} ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anyoneWins": MessageLookupByLibrary.simpleMessage("Anyone\'s won"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chooseYourFavoriteIcon":
            MessageLookupByLibrary.simpleMessage("Choose your favorite icon"),
        "colorOf": m0,
        "darkTheme": MessageLookupByLibrary.simpleMessage("Dark Theme"),
        "iconOf": m1,
        "icons": MessageLookupByLibrary.simpleMessage("Icons"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Light Theme"),
        "matchResult": MessageLookupByLibrary.simpleMessage("Match Result"),
        "newGame": MessageLookupByLibrary.simpleMessage("New Game"),
        "noRecords": MessageLookupByLibrary.simpleMessage(
            "Doesn\'t exist finished matches"),
        "play": MessageLookupByLibrary.simpleMessage("Play"),
        "player": m2,
        "playerWinner": m3,
        "record": MessageLookupByLibrary.simpleMessage("Record"),
        "resetSettings": MessageLookupByLibrary.simpleMessage("Reset settings"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectYourColor":
            MessageLookupByLibrary.simpleMessage("Select your color"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "systemTheme": MessageLookupByLibrary.simpleMessage("System Theme"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "ticTacToe": MessageLookupByLibrary.simpleMessage("Tic Tac Toe"),
        "tie": MessageLookupByLibrary.simpleMessage("Tie"),
        "winner": MessageLookupByLibrary.simpleMessage("Winner")
      };
}
