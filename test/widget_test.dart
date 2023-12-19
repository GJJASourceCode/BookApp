// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bookappproject/main.dart';

void main() {
  testWidgets('Example Test', (WidgetTester tester) async {
    // execute
    await tester.pumpWidget(MyApp());

    // 홈 페이지
    expect(find.text('Hello, World!'), findsOneWidget);

    // Bottom Navigation Bar의 아이템
    await tester.tap(find.byIcon(Icons.business));
    await tester.pumpAndSettle();

    // Business 페이지를 확인
    expect(find.text('Business'), findsOneWidget);

    // AppBar와 Bottom Navigation Bar의 배경색을 확인
    final appBar = find.byType(AppBar);
    final bottomNavigationBar = find.byType(BottomNavigationBar);

    final appBarBackgroundColor = tester.widget<AppBar>(appBar).backgroundColor;
    final bottomNavigationBarBackgroundColor = tester.widget<BottomNavigationBar>(bottomNavigationBar).backgroundColor;

    expect(appBarBackgroundColor, Color(0xFFFFFF00));
    expect(bottomNavigationBarBackgroundColor, Color(0xFFFFFF00));
  });
}


