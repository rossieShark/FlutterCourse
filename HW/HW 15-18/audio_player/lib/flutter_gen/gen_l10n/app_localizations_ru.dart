import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get recentlyPlayed => 'Недавно послушано';

  @override
  String get favouriteArtists => 'Любимые исполнители';

  @override
  String get bestAlbums => 'Лучшие альбомы';

  @override
  String get tabBarMyMusic => 'Моя музыка';

  @override
  String get tabBarSearch => 'Поиск';

  @override
  String get albumsFolder => 'Альбомы';

  @override
  String get tracksFolder => 'Треки';

  @override
  String get noMusicState => 'Пока нет ничего';

  @override
  String followers(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString Подписчики';
  }

  @override
  String subscriptions(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return '$countString Подписки';
  }

  @override
  String get userName => 'Пользователь';

  @override
  String get playlist => 'Плейлист';

  @override
  String get artist => 'Артист';

  @override
  String get addNewPlaylistDesc => 'Укажите название плейлиста';

  @override
  String get newPlaylistHintName => 'Плейлист';

  @override
  String get createButton => 'Создать';

  @override
  String get searchHistoryText => 'История поиска';

  @override
  String get searchHistoryResultText => 'История поиска пуста';

  @override
  String get searchTextFieldHintText => 'Что хочешь послушать?';

  @override
  String get settingPageTitle => 'Настройки';

  @override
  String get settingPageCommon => 'Общие';

  @override
  String get settingPageCommonLanguage => 'Язык';

  @override
  String get settingPageCommonSubscriptionPlan => 'Подписка';

  @override
  String get settingPageCommonDevices => 'Устройства';

  @override
  String get settingPageCommonTheme => 'Дизайн';

  @override
  String get settingPageAccount => 'Аккаунт';

  @override
  String get changePhotoButton => 'Сменить фото';

  @override
  String get changeNameTextFieldHintText => 'Ваше имя';

  @override
  String get changeNameDesc => 'Можно указать свое имя или псевдоним.';

  @override
  String get saveButton => 'Сохранить';

  @override
  String get settingPageAccountPassword => 'Пароль';

  @override
  String get settingPageAccountPayment => 'Оплата';

  @override
  String get settingPageAccountDelete => 'Удалить аккаунт';

  @override
  String get settingPageLogOut => 'Выйти';

  @override
  String get browseAll => 'Жанры';

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
  String get incorrectPasswordAlert =>
      'Неверный пароль или адрес электронной почты';

  @override
  String get signInButton => 'Войти';

  @override
  String get signInMethods => 'Войти с помощью';

  @override
  String get noAccount => 'У вас нет аккаунта?';

  @override
  String get signUpButton => 'Регистрация';

  @override
  String get invalidEmailPassword => 'Неверный e-mail или пароль';

  @override
  String get signUpMethods => 'Регистрация с';

  @override
  String get alreadyHaveAnAccount => 'У вас уже есть аккаунт?';

  @override
  String get confirmButton => 'Подтвердить';

  @override
  String get cancelButton => 'Отмена';

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
  String get error => 'Ошибка';

  @override
  String get noName => 'Нет Имени';

  @override
  String get homePageTitle => 'Главная';

  @override
  String get galleryButton => ' Галерея';

  @override
  String get cameraButton => ' Камера';

  @override
  String get clearAll => 'Очистить';

  @override
  String get searchResult => 'Результат поиска';

  @override
  String get noResultsText => 'Нет результатов';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get deleteAccount => 'Удаление аккаунта';

  @override
  String get deleteAccountAlert => 'Вы уверены, что хотите удалить аккаунт';

  @override
  String get folderNameMessage => 'Это имя уже занято';
}
