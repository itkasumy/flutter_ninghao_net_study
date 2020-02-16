import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './localizations_demessages_all.dart';

class LocalizationsDemo {
  static LocalizationsDemo of(BuildContext context) {
    return Localizations.of<LocalizationsDemo>(
      context,
      LocalizationsDemo
    );
  }

  static Future<LocalizationsDemo> load(Locale locale) {
    String name =
      locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return LocalizationsDemo();
    });
  }

  String get title => Intl.message(
    'hello',
    name: 'title',
    desc: 'Fugiat Lorem aliquip deserunt veniam.'
  );

  String greet(String name) => Intl.message(
    'hello $name',
    name: 'greet',
    desc: 'Cupidatat labore dolore velit mollir',
    args: [name]
  );
}

class LocalizationsDemoDelegate extends LocalizationsDelegate<LocalizationsDemo> {
  LocalizationsDemoDelegate();

  @override
  Future<LocalizationsDemo> load(Locale locale) {
    // TODO: implement load
    return LocalizationsDemo.load(locale);
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
