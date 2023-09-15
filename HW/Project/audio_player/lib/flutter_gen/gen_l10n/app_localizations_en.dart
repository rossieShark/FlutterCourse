import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get recentlyPlayed => 'Recently Played';

  @override
  String get favouriteArtists => 'Your favourite Artists';

  @override
  String get bestAlbums => 'Best Albums';

  @override
  String get tabBarMyMusic => 'My music';

  @override
  String get tabBarSearch => 'Search';

  @override
  String get albumsFolder => 'Albums';

  @override
  String get tracksFolder => 'Tracks';

  @override
  String get noMusicState => 'No Songs yet';

  @override
  String followers(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString Followers';
  }

  @override
  String subscriptions(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString Subscriptions';
  }

  @override
  String get userName => 'User';

  @override
  String get playlist => 'Playlist';

  @override
  String get artist => 'Artist';

  @override
  String get addNewPlaylistDesc => 'Write the name of Playlist';

  @override
  String get newPlaylistHintName => 'Name of playlist';

  @override
  String get createButton => 'Create';

  @override
  String get searchHistoryText => 'Search History';

  @override
  String get searchHistoryResultText => 'Search history is empty';

  @override
  String get searchTextFieldHintText => 'Song, Artist name, Album';

  @override
  String get settingPageTitle => 'Settings';

  @override
  String get settingPageCommon => 'Common';

  @override
  String get settingPageCommonLanguage => 'Language';

  @override
  String get settingPageCommonSubscriptionPlan => 'Subscription plan';

  @override
  String get settingPageCommonDevices => 'Devices';

  @override
  String get settingPageCommonTheme => 'Enable custom theme';

  @override
  String get settingPageAccount => 'Account';

  @override
  String get changePhotoButton => 'Change photo';

  @override
  String get changeNameTextFieldHintText => 'Your name';

  @override
  String get changeNameDesc => 'This could be your first name or a nickname';

  @override
  String get saveButton => 'Save';

  @override
  String get settingPageAccountPassword => 'Password';

  @override
  String get settingPageAccountPayment => 'Payment methods';

  @override
  String get settingPageAccountDelete => 'Delete account';

  @override
  String get settingPageLogOut => 'Log Out';

  @override
  String get browseAll => 'Browse All';

  @override
  String get allFilter => 'All';

  @override
  String get trackFilter => 'track';

  @override
  String get artistFilter => 'artist';

  @override
  String get changePassword => 'Enter new password';

  @override
  String get enterPassword => 'Enter password';

  @override
  String get enterEmail => 'Enter email';

  @override
  String get confirmPassword => 'Confirm new password';

  @override
  String get changebutton => 'Change';

  @override
  String get incorrectPasswordAlert => 'Incorrect password or email';

  @override
  String get signInButton => 'Sign In';

  @override
  String get signInMethods => 'Be connect with';

  @override
  String get noAccount => 'Do not have an account?';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get invalidEmailPassword => 'Invalid email or password';

  @override
  String get signUpMethods => 'Sign Up with';

  @override
  String get alreadyHaveAnAccount => 'Already have an account? ';

  @override
  String get confirmButton => 'Confirm';

  @override
  String get cancelButton => 'Calcel';

  @override
  String get okButton => 'OK';

  @override
  String get passwordMissmatch => 'Password mismatch';

  @override
  String get exitConfirmMessage => 'Are you sure you want to exit?';

  @override
  String get yesButton => 'Yes';

  @override
  String get noButton => 'No';

  @override
  String get googleSignError => 'Error when trying to log via Google.';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get sendButton => 'Send';

  @override
  String get noDataText => 'No Data';

  @override
  String get error => 'Error';

  @override
  String get noName => 'No name';

  @override
  String get homePageTitle => 'Home';

  @override
  String get galleryButton => ' Gallery';

  @override
  String get cameraButton => ' Camera';

  @override
  String get clearAll => 'Clear all';

  @override
  String get searchResult => 'Search Result';

  @override
  String get noResultsText => 'No results';

  @override
  String get forgotPassword => 'Forgot password';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get deleteAccountAlert =>
      'Are you sure you want to delete the account?';
}
