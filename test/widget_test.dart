// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app_testing/count_page.dart';
import 'package:flutter_app_testing/counter.dart';
import 'package:flutter_app_testing/person.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app_testing/main.dart';

void main() {
  /*
  Unit Test
   */
  // group("Counter 기능 테스트", (){
  //   test("초기 값이 0인가 ?", () {
  //     final Counter counter1 = Counter();
  //     expect(counter1.value, 0);
  //   });
  //
  //   test("증가 하는가 ?", () {
  //     final Counter counter0 = Counter();
  //     counter0.increment();
  //     expect(counter0.value, 1);
  //   });
  //
  //   test("감소 하는가 ?", () {
  //     final Counter counter = Counter();
  //     counter.decrement();
  //     expect(counter.value, -1);
  //   });
  // });
  //
  // group("Person 기능 테스트", () {
  //   test("초기 값이 NULL 인가 ?", () {
  //     final Person person0 = Person();
  //     expect(person0.name, null);
  //   });
  //
  //   test("이름을 변경할 수 있는가 ?", () {
  //     final Person person = Person();
  //     const String name = "TYGER";
  //     person.changedName(name);
  //     expect(person.name, name);
  //   });
  // });

  /*
  Widget TEst
   */

  testWidgets("CountWidget Test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CountPage()));

    // count 값이 0인지
    expect(find.text("0"), findsOneWidget);
    // count 값이 1이 아닌지
    expect(find.text("1"), findsNothing);
    // count 값이 -1이 아닌지
    expect(find.text("-1"), findsNothing);

    // 증가 버튼 클릭
    await tester.tap(find.byIcon(Icons.add));
    // 위젯 업데이트
    await tester.pump();
    // count 값이 1인지
    expect(find.text("1"), findsOneWidget);

    // 감소 버튼 2번 클릭
    await tester.tap(find.byIcon(Icons.remove));
    await tester.tap(find.byIcon(Icons.remove));
    // 위젯 업데이트
    await tester.pump();
    // count 값이 -1인지
    expect(find.text("-1"), findsOneWidget);

    // 초기화 버튼 클릭
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();
    // count 값이 0인지
    expect(find.text("0"), findsOneWidget);
  });
}
