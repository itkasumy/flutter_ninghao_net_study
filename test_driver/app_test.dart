import 'dart:math';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    FlutterDriver driver;

    final actionChip = find.byValueKey('actionChip');
    final actionChipLabelText = find.byValueKey('actionChipLabelText');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('start at 0', () async {
      expect(await driver.getText(actionChipLabelText), '0');
    });

    test('increments the counter', () async {
      await driver.tap(actionChip);

      expect(await driver.getText(actionChipLabelText), '1');
    });
  });
}