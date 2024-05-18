import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('SecondScreen benchmark test', () {
    // final buttonFinder = find.byType('FloatingActionButton');

    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    // test('add card 10', () async {
    //   await driver.tap(find.text('Карточки с текстом'));
    //   await Future.delayed(const Duration(seconds: 1));

    //   final timeline = await driver.traceAction(() async {
    //     for (int i = 0; i < 10; i++) {
    //       await driver.tap(buttonFinder);
    //       await Future.delayed(const Duration(milliseconds: 100));
    //     }
    //   });

    //   final summary = TimelineSummary.summarize(timeline);
    //   await summary.writeTimelineToFile('addCard10', pretty: true);
    // }, timeout: Timeout.none);

    // test('add card 100', () async {
    //   await driver.tap(find.text('Карточки с текстом'));
    //   await Future.delayed(const Duration(seconds: 1));

    //   final timeline = await driver.traceAction(() async {
    //     for (int i = 0; i < 10; i++) {
    //       await driver.tap(buttonFinder);
    //       await Future.delayed(const Duration(milliseconds: 100));
    //     }
    //   });

    //   final summary = TimelineSummary.summarize(timeline);
    //   await summary.writeTimelineToFile('addCard100', pretty: true);
    // }, timeout: Timeout.none);

    // test('finds the animation button and tests its functionality', () async {
    //   await driver.tap(find.text('Анимация с иконками и шейдером'));
    //   await Future.delayed(const Duration(seconds: 1));
    //   final btnAnim = find.byTooltip('animBtn');

    //   final timeline = await driver.traceAction(() async {
    //     for (int i = 0; i < 10; i++) {
    //       await driver.tap(btnAnim);
    //       await Future.delayed(const Duration(seconds: 2));
    //     }
    //   });

    //   final summary = TimelineSummary.summarize(timeline);
    //   await summary.writeTimelineToFile('anim10', pretty: true);
    // }, timeout: Timeout.none);

    // test('finds the animation button and tests its functionality', () async {
    //   await driver.tap(find.text('Анимация с иконками и шейдером'));
    //   await Future.delayed(const Duration(seconds: 1));
    //   final btnAnim = find.byTooltip('animBtn');

    //   final timeline = await driver.traceAction(() async {
    //     for (int i = 0; i < 100; i++) {
    //       await driver.tap(btnAnim);
    //       await Future.delayed(const Duration(seconds: 2));
    //     }
    //   });

    //   final summary = TimelineSummary.summarize(timeline);
    //   await summary.writeTimelineToFile('anim100', pretty: true);
    // }, timeout: Timeout.none);

    test('Rotate ModelViewer', () async {
      final timeline = await driver.traceAction(() async {
        await driver.tap(find.text('3D Model'));
        await Future.delayed(const Duration(seconds: 5));

        final scaffoldFinder = find.byValueKey('3dModel');
        await Future.delayed(const Duration(seconds: 10));
      });

      final summary = TimelineSummary.summarize(timeline);
      await summary.writeTimelineToFile('3dModel', pretty: true);
    }, timeout: Timeout.none);
  });
}
