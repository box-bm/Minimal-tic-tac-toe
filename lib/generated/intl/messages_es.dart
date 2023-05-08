// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(playerName) => "Color de ${playerName} ";

  static String m1(playerName) => "Icono de ${playerName}";

  static String m2(playerNumber) => "Jugador ${playerNumber}";

  static String m3(playerName) => "Ganador: ${playerName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "anyoneWins": MessageLookupByLibrary.simpleMessage("Nadie gana"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "chooseYourFavoriteIcon":
            MessageLookupByLibrary.simpleMessage("Elije tu icono favorito"),
        "colorOf": m0,
        "iconOf": m1,
        "icons": MessageLookupByLibrary.simpleMessage("Iconos"),
        "matchResult":
            MessageLookupByLibrary.simpleMessage("Resultado de la partida"),
        "newGame": MessageLookupByLibrary.simpleMessage("Nuevo juego"),
        "noRecords":
            MessageLookupByLibrary.simpleMessage("No hay partidas finalizadas"),
        "play": MessageLookupByLibrary.simpleMessage("Jugar"),
        "player": m2,
        "playerWinner": m3,
        "record": MessageLookupByLibrary.simpleMessage("Historial"),
        "resetSettings":
            MessageLookupByLibrary.simpleMessage("Restablecer ajustes"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "selectYourColor":
            MessageLookupByLibrary.simpleMessage("Elije tu color"),
        "settings": MessageLookupByLibrary.simpleMessage("Ajustes"),
        "share": MessageLookupByLibrary.simpleMessage("Compartir"),
        "ticTacToe": MessageLookupByLibrary.simpleMessage("Tic Tac Toe"),
        "tie": MessageLookupByLibrary.simpleMessage("Empate"),
        "winner": MessageLookupByLibrary.simpleMessage("Ganador")
      };
}
