import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('ru')
  ];

  /// This is title for recentlyPlayed bloc of code
  ///
  /// In en, this message translates to:
  /// **'Recently Played'**
  String get recentlyPlayed;

  /// This is title for favouriteArtists bloc of code
  ///
  /// In en, this message translates to:
  /// **'Your favourite Artists'**
  String get favouriteArtists;

  /// This is title for bestAlbums bloc of code
  ///
  /// In en, this message translates to:
  /// **'Best Albums'**
  String get bestAlbums;

  /// This is title for tabBar MyMusic section
  ///
  /// In en, this message translates to:
  /// **'My music'**
  String get tabBarMyMusic;

  /// This is title for tabBar Search section
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get tabBarSearch;

  /// This is title for albumsFolder in myMusic
  ///
  /// In en, this message translates to:
  /// **'Albums'**
  String get albumsFolder;

  /// This is title for tracksFolder in myMusic
  ///
  /// In en, this message translates to:
  /// **'Tracks'**
  String get tracksFolder;

  /// This is title for noMusicState in myMusic
  ///
  /// In en, this message translates to:
  /// **'No Songs yet'**
  String get noMusicState;

  /// This is title for followers section
  ///
  /// In en, this message translates to:
  /// **'{count} Followers'**
  String followers(int count);

  /// This is title for subscriptions
  ///
  /// In en, this message translates to:
  /// **'{count} Subscriptions'**
  String subscriptions(int count);

  /// This is title for userName in myMusic
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userName;

  /// This is title for playlist in myMusic
  ///
  /// In en, this message translates to:
  /// **'Playlist'**
  String get playlist;

  /// This is title for artist in myMusic
  ///
  /// In en, this message translates to:
  /// **'Artist'**
  String get artist;

  /// This describes what happens in myMusic when you add a new playlist.
  ///
  /// In en, this message translates to:
  /// **'Write the name of Playlist'**
  String get addNewPlaylistDesc;

  /// Hint text in textField when you add a new playlist
  ///
  /// In en, this message translates to:
  /// **'Name of playlist'**
  String get newPlaylistHintName;

  /// createButton when you add a new playlist
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get createButton;

  /// Search history text in searchPage
  ///
  /// In en, this message translates to:
  /// **'Search History'**
  String get searchHistoryText;

  /// Search history result text in searchPage
  ///
  /// In en, this message translates to:
  /// **'Search history is empty'**
  String get searchHistoryResultText;

  /// Search text Field hint  text in searchPage
  ///
  /// In en, this message translates to:
  /// **'Song, Artist name, Album'**
  String get searchTextFieldHintText;

  /// Setting Page title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingPageTitle;

  /// Setting Page common bloc
  ///
  /// In en, this message translates to:
  /// **'Common'**
  String get settingPageCommon;

  /// Setting Page common - language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingPageCommonLanguage;

  /// Setting Page common - Subscription plan
  ///
  /// In en, this message translates to:
  /// **'Subscription plan'**
  String get settingPageCommonSubscriptionPlan;

  /// Setting Page common - Devices
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get settingPageCommonDevices;

  /// Setting Page common - Theme
  ///
  /// In en, this message translates to:
  /// **'Enable custom theme'**
  String get settingPageCommonTheme;

  /// Setting Page account
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingPageAccount;

  /// changePhotoButton in settings page
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get changePhotoButton;

  /// change name text field hint text
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get changeNameTextFieldHintText;

  /// Change name description text
  ///
  /// In en, this message translates to:
  /// **'This could be your first name or a nickname'**
  String get changeNameDesc;

  /// SaveButton text
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveButton;

  /// Setting Page account - Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get settingPageAccountPassword;

  /// Setting Page account - payment
  ///
  /// In en, this message translates to:
  /// **'Payment methods'**
  String get settingPageAccountPayment;

  /// Setting Page account - Delete
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get settingPageAccountDelete;

  /// Setting Page logOut button
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get settingPageLogOut;

  /// This is title for genresSection in searchPage(web)
  ///
  /// In en, this message translates to:
  /// **'Browse All'**
  String get browseAll;

  /// This is title for allFilter in searchPage(web)
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// This is title for trackFilter in searchPage(web)
  ///
  /// In en, this message translates to:
  /// **'track'**
  String get trackFilter;

  /// This is title for artistFilter in searchPage(web)
  ///
  /// In en, this message translates to:
  /// **'artist'**
  String get artistFilter;

  /// This is changePassword TextField hint text in settingsPage
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get changePassword;

  /// Enter password hint text
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// Enter email hint text
  ///
  /// In en, this message translates to:
  /// **'Enter email'**
  String get enterEmail;

  /// This is confirmPassword TextField hint text in settingsPage
  ///
  /// In en, this message translates to:
  /// **'Confirm new password'**
  String get confirmPassword;

  /// This is change button text in settingsPage
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get changebutton;

  /// incorrectPasswordAlert text
  ///
  /// In en, this message translates to:
  /// **'Incorrect password or email'**
  String get incorrectPasswordAlert;

  /// Sign In button
  ///
  /// In en, this message translates to:
  /// **' Sign In'**
  String get signInButton;

  /// Sign In methods
  ///
  /// In en, this message translates to:
  /// **'Be connect with'**
  String get signInMethods;

  /// Don't have an account text
  ///
  /// In en, this message translates to:
  /// **'Do not have an account?'**
  String get noAccount;

  /// Sign Up button
  ///
  /// In en, this message translates to:
  /// **' Sign Up'**
  String get signUpButton;

  /// Invalid email or password alert
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidEmailPassword;

  /// Sign Up methods
  ///
  /// In en, this message translates to:
  /// **'Sign Up with'**
  String get signUpMethods;

  /// Already have an account? text
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAnAccount;

  /// Confirm button
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmButton;

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// Password mismatch Alert
  ///
  /// In en, this message translates to:
  /// **'Password mismatch'**
  String get passwordMissmatch;

  /// Exit confirm message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to exit?'**
  String get exitConfirmMessage;

  /// Yes button
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yesButton;

  /// No button
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get noButton;

  /// Google sign errror message
  ///
  /// In en, this message translates to:
  /// **'Error when trying to log via Google.'**
  String get googleSignError;

  /// reset password alert message
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// Send button
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get sendButton;

  /// No Data text
  ///
  /// In en, this message translates to:
  /// **'No Data'**
  String get noDataText;

  /// Error
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No name
  ///
  /// In en, this message translates to:
  /// **'No name'**
  String get noName;

  /// Home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homePageTitle;

  /// Gallery Image picker
  ///
  /// In en, this message translates to:
  /// **' Gallery'**
  String get galleryButton;

  /// Camera Image picker
  ///
  /// In en, this message translates to:
  /// **' Camera'**
  String get cameraButton;

  /// Clear all button
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// Search result text
  ///
  /// In en, this message translates to:
  /// **'Search Result'**
  String get searchResult;

  /// No results text
  ///
  /// In en, this message translates to:
  /// **'No results'**
  String get noResultsText;

  /// Forgot password
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// Delete account
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// Delete account alert message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the account?'**
  String get deleteAccountAlert;

  /// Please enter a unique name Alert message
  ///
  /// In en, this message translates to:
  /// **'Please enter a unique name'**
  String get folderNameMessage;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
