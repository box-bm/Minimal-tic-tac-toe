// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Player {playerNumber}`
  String player(Object playerNumber) {
    return Intl.message(
      'Player $playerNumber',
      name: 'player',
      desc: '',
      args: [playerNumber],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Winner`
  String get winner {
    return Intl.message(
      'Winner',
      name: 'winner',
      desc: '',
      args: [],
    );
  }

  /// `Tie`
  String get tie {
    return Intl.message(
      'Tie',
      name: 'tie',
      desc: '',
      args: [],
    );
  }

  /// `Anyone's won`
  String get anyoneWins {
    return Intl.message(
      'Anyone\'s won',
      name: 'anyoneWins',
      desc: '',
      args: [],
    );
  }

  /// `Select your color`
  String get selectYourColor {
    return Intl.message(
      'Select your color',
      name: 'selectYourColor',
      desc: '',
      args: [],
    );
  }

  /// `{playerName} color`
  String colorOf(Object playerName) {
    return Intl.message(
      '$playerName color',
      name: 'colorOf',
      desc: '',
      args: [playerName],
    );
  }

  /// `{playerName} icon`
  String iconOf(Object playerName) {
    return Intl.message(
      '$playerName icon',
      name: 'iconOf',
      desc: '',
      args: [playerName],
    );
  }

  /// `Reset settings`
  String get resetSettings {
    return Intl.message(
      'Reset settings',
      name: 'resetSettings',
      desc: '',
      args: [],
    );
  }

  /// `Icons`
  String get icons {
    return Intl.message(
      'Icons',
      name: 'icons',
      desc: '',
      args: [],
    );
  }

  /// `Choose your favorite icon`
  String get chooseYourFavoriteIcon {
    return Intl.message(
      'Choose your favorite icon',
      name: 'chooseYourFavoriteIcon',
      desc: '',
      args: [],
    );
  }

  /// `Tic Tac Toe`
  String get ticTacToe {
    return Intl.message(
      'Tic Tac Toe',
      name: 'ticTacToe',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Winner: {playerName} `
  String playerWinner(Object playerName) {
    return Intl.message(
      'Winner: $playerName ',
      name: 'playerWinner',
      desc: '',
      args: [playerName],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Match Result`
  String get matchResult {
    return Intl.message(
      'Match Result',
      name: 'matchResult',
      desc: '',
      args: [],
    );
  }

  /// `Doesn't exist finished matches`
  String get noRecords {
    return Intl.message(
      'Doesn\'t exist finished matches',
      name: 'noRecords',
      desc: '',
      args: [],
    );
  }

  /// `New Game`
  String get newGame {
    return Intl.message(
      'New Game',
      name: 'newGame',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get lightTheme {
    return Intl.message(
      'Light Theme',
      name: 'lightTheme',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get systemTheme {
    return Intl.message(
      'System Theme',
      name: 'systemTheme',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Download Minimal tic tac toe App from: https://bit.ly/minimal-tic-tac-toe, you'll love it! ❌⭕️`
  String get shareTextContent {
    return Intl.message(
      'Download Minimal tic tac toe App from: https://bit.ly/minimal-tic-tac-toe, you\'ll love it! ❌⭕️',
      name: 'shareTextContent',
      desc: '',
      args: [],
    );
  }

  /// `Sounds enabled`
  String get soundsEnabled {
    return Intl.message(
      'Sounds enabled',
      name: 'soundsEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Single Player`
  String get singlePlayer {
    return Intl.message(
      'Single Player',
      name: 'singlePlayer',
      desc: '',
      args: [],
    );
  }

  /// `Multiplayer`
  String get multiplayer {
    return Intl.message(
      'Multiplayer',
      name: 'multiplayer',
      desc: '',
      args: [],
    );
  }

  /// `Easy`
  String get easy {
    return Intl.message(
      'Easy',
      name: 'easy',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Hard`
  String get hard {
    return Intl.message(
      'Hard',
      name: 'hard',
      desc: '',
      args: [],
    );
  }

  /// `Impossible`
  String get impossible {
    return Intl.message(
      'Impossible',
      name: 'impossible',
      desc: '',
      args: [],
    );
  }

  /// `Difficult`
  String get difficult {
    return Intl.message(
      'Difficult',
      name: 'difficult',
      desc: '',
      args: [],
    );
  }

  /// `Select the difficulty of the game`
  String get selectYourDifficultLabel {
    return Intl.message(
      'Select the difficulty of the game',
      name: 'selectYourDifficultLabel',
      desc: '',
      args: [],
    );
  }

  /// `Rate my app`
  String get rateTitle {
    return Intl.message(
      'Rate my app',
      name: 'rateTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you are liking the game, give us a rating.`
  String get rateMessage {
    return Intl.message(
      'If you are liking the game, give us a rating.',
      name: 'rateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Rate`
  String get rateButton {
    return Intl.message(
      'Rate',
      name: 'rateButton',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get noRateButton {
    return Intl.message(
      'No',
      name: 'noRateButton',
      desc: '',
      args: [],
    );
  }

  /// `Rate later`
  String get rateLaterButton {
    return Intl.message(
      'Rate later',
      name: 'rateLaterButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign out from Play Games`
  String get signOutGooglePlayGames {
    return Intl.message(
      'Sign out from Play Games',
      name: 'signOutGooglePlayGames',
      desc: '',
      args: [],
    );
  }

  /// `Sign in on Google Play Games`
  String get signInGooglePlayGames {
    return Intl.message(
      'Sign in on Google Play Games',
      name: 'signInGooglePlayGames',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
