import 'dart:io';
//import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter/widgets.dart';
import 'package:integration_test/integration_test_driver.dart';
//import 'package:test/test.dart' as test;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  new Directory('screenshots').create();


  testWidgets("screenshot test", (WidgetTester tester) async {
    // if youre running the tests locally then the path will be screenshots/filename.png
    await tester.pumpWidget();
    await tester.tap(find.byKey(Key('button')));
    expect(await tester.getText(find.byKey(Key('count-value'))), '1');
    await tester.pump();
  });
  // testWidgets("screenshot test", (WidgetTester tester) async {
  //   // if youre running the tests locally then the path will be screenshots/filename.png
  //   await takeScreenshot(tester, 'screenshots/counter_value1.png');
  //   await tester.tap(find.byKey(Key('button')));
  //   expect(await tester.getText(find.byKey(Key('count-value'))), '1');
  //   await takeScreenshot(tester, 'screenshots/counter_value2.png');
  // });
}

// takeScreenshot(WidgetTester driver, String path) async {
//   final List<int> pixels = await driver.screenshot();
//   final File file = new File(path);
//   await file.writeAsBytes(pixels);
//   print(path);
// }
