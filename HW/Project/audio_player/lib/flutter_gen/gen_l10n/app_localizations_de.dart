import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get recentlyPlayed => 'Kürzlich gespielt';

  @override
  String get favouriteArtists => 'Ihre Lieblingskünstler';

  @override
  String get bestAlbums => 'beste Alben';

  @override
  String get tabBarMyMusic => 'Meine Musik';

  @override
  String get tabBarSearch => 'Suchen';

  @override
  String get albumsFolder => 'Alben';

  @override
  String get tracksFolder => 'Spuren';

  @override
  String get noMusicState => 'Пока нет ничего';

  @override
  String followers(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString Anhänger';
  }

  @override
  String subscriptions(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return ' $countString Abonnements';
  }

  @override
  String get userName => 'Benutzer';

  @override
  String get playlist => 'Wiedergabeliste';

  @override
  String get artist => 'Künstler';

  @override
  String get addNewPlaylistDesc => 'Geben Sie den Namen der Playlist ein';

  @override
  String get newPlaylistHintName => 'Name der Playlist';

  @override
  String get createButton => 'Erstellen';

  @override
  String get searchHistoryText => 'Suchverlauf';

  @override
  String get searchHistoryResultText => 'Der Suchverlauf ist leer';

  @override
  String get searchTextFieldHintText => 'Lied, Künstlername, Album';

  @override
  String get settingPageTitle => 'Einstellungen';

  @override
  String get settingPageCommon => 'Gemeinsam';

  @override
  String get settingPageCommonLanguage => 'Sprache';

  @override
  String get settingPageCommonSubscriptionPlan => 'Abonnementplan';

  @override
  String get settingPageCommonDevices => 'Geräte';

  @override
  String get settingPageCommonTheme => 'Aktivieren Sie ein Design';

  @override
  String get settingPageAccount => 'Konto';

  @override
  String get changePhotoButton => 'Foto ändern';

  @override
  String get changeNameTextFieldHintText => 'Ihr Name';

  @override
  String get changeNameDesc => 'Dies kann Ihr Vorname oder ein Spitzname sein';

  @override
  String get saveButton => 'Speichern';

  @override
  String get settingPageAccountPassword => 'Passwort';

  @override
  String get settingPageAccountPayment => 'Zahlungsarten';

  @override
  String get settingPageAccountDelete => 'Konto löschen';

  @override
  String get settingPageLogOut => 'Ausloggen';

  @override
  String get browseAll => 'Alle durchsuchen';

  @override
  String get allFilter => 'All';

  @override
  String get trackFilter => 'track';

  @override
  String get artistFilter => 'artist';

  @override
  String get changePassword => 'Изменить пароль';

  @override
  String get enterPassword => 'Пароль';

  @override
  String get enterEmail => 'Email';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get changebutton => 'Изменить';

  @override
  String get incorrectPasswordAlert => 'Неправильный пароль или email';

  @override
  String get signInButton => 'Войти';

  @override
  String get signInMethods => 'Зайти с помощью';

  @override
  String get noAccount => 'Нет аккаунта';

  @override
  String get signUpButton => 'Зарегистрироваться';

  @override
  String get invalidEmailPassword =>
      'Неверный адрес электронной почты или пароль';

  @override
  String get signUpMethods => 'Регистрация с';

  @override
  String get alreadyHaveAnAccount => 'У вас уже есть учетная запись? ';

  @override
  String get confirmButton => 'Подтвердить';

  @override
  String get cancelButton => 'Отменить';

  @override
  String get okButton => 'OK';

  @override
  String get passwordMissmatch => 'Пароли не совпадают';

  @override
  String get exitConfirmMessage => 'Вы уверены, что хотите выйти?';

  @override
  String get yesButton => 'Да';

  @override
  String get noButton => 'Нет';

  @override
  String get googleSignError =>
      'Ошибка при попытке войти в систему через Google.';

  @override
  String get resetPassword => 'Восстановление пароля';

  @override
  String get sendButton => 'Отправить';

  @override
  String get noDataText => 'No Data';

  @override
  String get error => 'Fehler';

  @override
  String get noName => 'Kein Name';

  @override
  String get homePageTitle => 'Startseite';

  @override
  String get galleryButton => ' Galerie';

  @override
  String get cameraButton => ' Kamera';

  @override
  String get clearAll => 'Alle löschen';

  @override
  String get searchResult => 'Suchergebnis';

  @override
  String get noResultsText => 'Keine Ergebnisse';

  @override
  String get forgotPassword => 'Passwort vergessen';

  @override
  String get deleteAccount => 'Account löschen';

  @override
  String get deleteAccountAlert =>
      'Sind Sie sicher, dass Sie das Konto löschen wollen?';
}
