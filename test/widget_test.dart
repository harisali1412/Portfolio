// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/main.dart';

void main() {
  testWidgets('App builds smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });

  testWidgets('Accent palette updates the app theme', (
    WidgetTester tester,
  ) async {
    portfolioPalette.value = portfolioPalettes.first;
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Choose accent colour').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rose').last);
    await tester.pumpAndSettle();

    expect(portfolioPalette.value, portfolioPalettes.last);
    expect(
      Theme.of(tester.element(find.byType(Scaffold))).colorScheme.primary,
      portfolioPalettes.last.primary,
    );
  });

  testWidgets('Portfolio fits a mobile viewport', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    portfolioPalette.value = portfolioPalettes.first;

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byType(Scaffold)).width, 390);
    expect(
      MediaQuery.sizeOf(tester.element(find.byType(Scaffold))).width,
      390,
    );
    expect(find.text('AI & Machine Learning'), findsOneWidget);
  });
}
