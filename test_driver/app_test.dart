import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Driver demo', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      new Directory('screenshots').create();
    });

    test('check flutter driver health', () async {
      Health health = await driver.checkHealth();
      print(health.status);
    });

    test('screenshot test', () async {
      // if youre running the tests locally then the path will be screenshots/filename.png
      // if youre running the tests on codemagic then the path will be /Users/builder/exported_artefacts
      await takeScreenshot(driver, 'Users/builder/exported_artefacts/counter_value1.png');
      await driver.tap(find.byValueKey('button'));
      expect(await driver.getText(find.byValueKey('count-value')), '1');
      await takeScreenshot(driver, 'Users/builder/exported_artefacts/counter_value2.png');
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });
  });
}

takeScreenshot(FlutterDriver driver, String path) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(path);
  await file.writeAsBytes(pixels);
  print(path);
}