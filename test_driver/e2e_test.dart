import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byTooltip('Increment');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('value should start at 0', () async {
      expect(await driver.getText(counterTextFinder), '0',
          reason: 'Initial count is not 0');
    });

    test('value should be incremented', () async {
      int i = 1;
      while (i < 4) {
        await driver.tap(buttonFinder);
        expect(await driver.getText(counterTextFinder), i.toString(),
            reason: 'Tap & count is not matching');
        i++;
      }
    });
  });
}
