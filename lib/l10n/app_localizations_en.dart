// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String player(Object playerNumber) {
    return 'Player $playerNumber';
  }

  @override
  String get settings => 'Settings';

  @override
  String get play => 'Play';

  @override
  String get share => 'Share';

  @override
  String get winner => 'Winner';

  @override
  String get tie => 'Tie';

  @override
  String get anyoneWins => 'Anyone\'s won';

  @override
  String get selectYourColor => 'Select your color';

  @override
  String colorOf(Object playerName) {
    return '$playerName color';
  }

  @override
  String iconOf(Object playerName) {
    return '$playerName icon';
  }

  @override
  String get resetSettings => 'Reset settings';

  @override
  String get icons => 'Icons';

  @override
  String get chooseYourFavoriteIcon => 'Choose your favorite icon';

  @override
  String get ticTacToe => 'Tic Tac Toe';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String playerWinner(Object playerName) {
    return 'Winner: $playerName ';
  }

  @override
  String get record => 'Record';

  @override
  String get matchResult => 'Match Result';

  @override
  String get noRecords => 'Doesn\'t exist finished matches';

  @override
  String get newGame => 'New Game';

  @override
  String get darkTheme => 'Dark Theme';

  @override
  String get lightTheme => 'Light Theme';

  @override
  String get systemTheme => 'System Theme';

  @override
  String get theme => 'Theme';

  @override
  String get shareTextContent =>
      'Download Minimal tic tac toe App from: https://bit.ly/minimal-tic-tac-toe, you\'ll love it! ❌⭕️';

  @override
  String get soundsEnabled => 'Sounds enabled';

  @override
  String get singlePlayer => 'Single Player';

  @override
  String get multiplayer => 'Multiplayer';

  @override
  String get easy => 'Easy';

  @override
  String get medium => 'Medium';

  @override
  String get hard => 'Hard';

  @override
  String get impossible => 'Impossible';

  @override
  String get difficult => 'Difficult';

  @override
  String get selectYourDifficultLabel => 'Select the difficulty of the game';

  @override
  String get rateTitle => 'Rate my app';

  @override
  String get rateMessage => 'If you are liking the game, give us a rating.';

  @override
  String get rateButton => 'Rate';

  @override
  String get noRateButton => 'No';

  @override
  String get rateLaterButton => 'Rate later';
}
