// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Zomato';

  @override
  String get delivery => 'Delivery';

  @override
  String get money => 'Money';

  @override
  String get searchHint => 'Restaurant name or a dish...';

  @override
  String get chooseLanguage => 'Choose language';

  @override
  String get selectLanguage => 'Select Language';
}
