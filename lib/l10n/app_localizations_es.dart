// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String player(Object playerNumber) {
    return 'Jugador $playerNumber';
  }

  @override
  String get settings => 'Ajustes';

  @override
  String get play => 'Jugar';

  @override
  String get share => 'Compartir';

  @override
  String get winner => 'Ganador';

  @override
  String get tie => 'Empate';

  @override
  String get anyoneWins => 'Nadie gana';

  @override
  String get selectYourColor => 'Elije tu color';

  @override
  String colorOf(Object playerName) {
    return 'Color de $playerName ';
  }

  @override
  String iconOf(Object playerName) {
    return 'Icono de $playerName';
  }

  @override
  String get resetSettings => 'Restablecer ajustes';

  @override
  String get icons => 'Iconos';

  @override
  String get chooseYourFavoriteIcon => 'Elije tu icono favorito';

  @override
  String get ticTacToe => 'Tic Tac Toe';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';

  @override
  String playerWinner(Object playerName) {
    return 'Ganador: $playerName';
  }

  @override
  String get record => 'Historial';

  @override
  String get matchResult => 'Resultado de la partida';

  @override
  String get noRecords => 'No hay partidas finalizadas';

  @override
  String get newGame => 'Nuevo juego';

  @override
  String get darkTheme => 'Tema Oscuro';

  @override
  String get lightTheme => 'Tema Claro';

  @override
  String get systemTheme => 'Tema del sistema';

  @override
  String get theme => 'Tema';

  @override
  String get shareTextContent =>
      'Descarga la app de Minimal tic tac toe desde: https://bit.ly/minimal-tic-tac-toe, te encantará! ❌⭕️';

  @override
  String get soundsEnabled => 'Sonido activo';

  @override
  String get singlePlayer => 'Un Jugador';

  @override
  String get multiplayer => 'Multijugador';

  @override
  String get easy => 'Fácil';

  @override
  String get medium => 'Medio';

  @override
  String get hard => 'Dificil';

  @override
  String get impossible => 'Imposible';

  @override
  String get difficult => 'Dificultad';

  @override
  String get selectYourDifficultLabel => 'Selecciona la dificultad del juego';

  @override
  String get rateTitle => 'Califica mi aplicacion';

  @override
  String get rateMessage =>
      'Si te esta gustando el juego, regalanos una calificación';

  @override
  String get rateButton => 'Calificar';

  @override
  String get noRateButton => 'No';

  @override
  String get rateLaterButton => 'Recordar más tarde';
}
