import 'package:app/locator.dart';
import 'package:app/presentation/screens/bloc_state_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const String incrementButtonKey = "increment";
  const String decrementButtonKey = "decrement";

  group("Bloc Screen Tests", () {
    setUpAll(() {
      setupLocator();
    });

    testWidgets('increments counter', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BlocStateScreen()));
      expect(find.text('0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey(incrementButtonKey)));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('decrements counter', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BlocStateScreen()));
      expect(find.text('0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey(incrementButtonKey)));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey(decrementButtonKey)));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('cannod decrement less than zero', (tester) async {
      await tester.pumpWidget(MaterialApp(home: BlocStateScreen()));
      expect(find.text('0'), findsOneWidget);
      await tester.tap(find.byKey(ValueKey(decrementButtonKey)));
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
    });
  });
}
