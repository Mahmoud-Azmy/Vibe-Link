import 'package:flutter/material.dart';
import 'package:vibe_link/core/helper/shared_pref_helper.dart';
import 'package:vibe_link/core/utils/app_strings.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final code = await SharedPrefHelper.getString(AppStrings.localeKey);
    if (code.isNotEmpty) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  void setLocale(Locale locale) {
    if (_locale == locale) return;
    _locale = locale;
    SharedPrefHelper.setData(AppStrings.localeKey, locale.languageCode);
    notifyListeners();
  }
}
