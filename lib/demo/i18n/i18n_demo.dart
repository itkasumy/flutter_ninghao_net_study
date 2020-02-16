import 'package:flutter/material.dart';
// import 'package:flutter_start_up/demo/i18n/map/localizations_demo.dart';
import 'package:flutter_start_up/demo/i18n/intl/localizations_demo.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${locale.languageCode}'),
            Text(locale.toString()),
            Text(
              Localizations.of(context, LocalizationsDemo).title,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              LocalizationsDemo.of(context).title,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              LocalizationsDemo.of(context).greet('Jun'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
