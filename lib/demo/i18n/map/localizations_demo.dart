import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LocalizationsDemo {
  final Locale locale;

  LocalizationsDemo(this.locale);

  static LocalizationsDemo of(BuildContext context) {
    return Localizations.of<LocalizationsDemo>(
      context,
      LocalizationsDemo
    );
  }

  static Map<String, Map<String, String>> _localized =  {
    'en': {
      'title': 'Hello'
    },
    'zh': {
      'title': '您好'
    }
  }; 

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class LocalizationsDemoDelegate extends LocalizationsDelegate<LocalizationsDemo> {
  LocalizationsDemoDelegate();

  @override
  Future<LocalizationsDemo> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<LocalizationsDemo>(
      LocalizationsDemo(locale),
    );
  }

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsDemo> old) {
    // TODO: implement shouldReload
    return false;
  }
}
