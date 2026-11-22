import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @player.
  ///
  /// In en, this message translates to:
  /// **'Player {playerNumber}'**
  String player(Object playerNumber);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @winner.
  ///
  /// In en, this message translates to:
  /// **'Winner'**
  String get winner;

  /// No description provided for @tie.
  ///
  /// In en, this message translates to:
  /// **'Tie'**
  String get tie;

  /// No description provided for @anyoneWins.
  ///
  /// In en, this message translates to:
  /// **'Anyone\'s won'**
  String get anyoneWins;

  /// No description provided for @selectYourColor.
  ///
  /// In en, this message translates to:
  /// **'Select your color'**
  String get selectYourColor;

  /// No description provided for @colorOf.
  ///
  /// In en, this message translates to:
  /// **'{playerName} color'**
  String colorOf(Object playerName);

  /// No description provided for @iconOf.
  ///
  /// In en, this message translates to:
  /// **'{playerName} icon'**
  String iconOf(Object playerName);

  /// No description provided for @resetSettings.
  ///
  /// In en, this message translates to:
  /// **'Reset settings'**
  String get resetSettings;

  /// No description provided for @icons.
  ///
  /// In en, this message translates to:
  /// **'Icons'**
  String get icons;

  /// No description provided for @chooseYourFavoriteIcon.
  ///
  /// In en, this message translates to:
  /// **'Choose your favorite icon'**
  String get chooseYourFavoriteIcon;

  /// No description provided for @ticTacToe.
  ///
  /// In en, this message translates to:
  /// **'Tic Tac Toe'**
  String get ticTacToe;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @playerWinner.
  ///
  /// In en, this message translates to:
  /// **'Winner: {playerName} '**
  String playerWinner(Object playerName);

  /// No description provided for @record.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// No description provided for @matchResult.
  ///
  /// In en, this message translates to:
  /// **'Match Result'**
  String get matchResult;

  /// No description provided for @noRecords.
  ///
  /// In en, this message translates to:
  /// **'Doesn\'t exist finished matches'**
  String get noRecords;

  /// No description provided for @newGame.
  ///
  /// In en, this message translates to:
  /// **'New Game'**
  String get newGame;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get systemTheme;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @shareTextContent.
  ///
  /// In en, this message translates to:
  /// **'Download Minimal tic tac toe App from: https://bit.ly/minimal-tic-tac-toe, you\'ll love it! ❌⭕️'**
  String get shareTextContent;

  /// No description provided for @soundsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Sounds enabled'**
  String get soundsEnabled;

  /// No description provided for @singlePlayer.
  ///
  /// In en, this message translates to:
  /// **'Single Player'**
  String get singlePlayer;

  /// No description provided for @multiplayer.
  ///
  /// In en, this message translates to:
  /// **'Multiplayer'**
  String get multiplayer;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @impossible.
  ///
  /// In en, this message translates to:
  /// **'Impossible'**
  String get impossible;

  /// No description provided for @difficult.
  ///
  /// In en, this message translates to:
  /// **'Difficult'**
  String get difficult;

  /// No description provided for @selectYourDifficultLabel.
  ///
  /// In en, this message translates to:
  /// **'Select the difficulty of the game'**
  String get selectYourDifficultLabel;

  /// No description provided for @rateTitle.
  ///
  /// In en, this message translates to:
  /// **'Rate my app'**
  String get rateTitle;

  /// No description provided for @rateMessage.
  ///
  /// In en, this message translates to:
  /// **'If you are liking the game, give us a rating.'**
  String get rateMessage;

  /// No description provided for @rateButton.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get rateButton;

  /// No description provided for @noRateButton.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noRateButton;

  /// No description provided for @rateLaterButton.
  ///
  /// In en, this message translates to:
  /// **'Rate later'**
  String get rateLaterButton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
