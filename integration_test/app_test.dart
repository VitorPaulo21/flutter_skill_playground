import 'package:app/locator.dart';
import 'package:app/main.dart';
import 'package:app/presentation/router/skill_router_delegate.dart';
import 'package:app/presentation/screens/animation_screen.dart';
import 'package:app/presentation/screens/bloc_state_screen.dart';
import 'package:app/presentation/screens/dependency_injection_screen.dart';
import 'package:app/presentation/screens/isolate_screen.dart';
import 'package:app/presentation/screens/performance_screen.dart';
import 'package:app/presentation/screens/platform_channel_screen.dart';
import 'package:app/presentation/screens/router_2_screen.dart';
import 'package:app/presentation/screens/sliver_screen.dart';
import 'package:app/presentation/screens/stream_builder_error_handler_screen.dart';
import 'package:app/presentation/widgets/stream_builder_screen/stream_error_handler_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const String telaAButtonKey = "telaA";
  const String telaBButtonKey = "telaB";
  const String incrementButtonKey = "increment";
  const String decrementButtonKey = "decrement";
  const String isolateTextFieldKey = "textField";
  const String logMessageButtom = "Logar Mensagem";
  const String clearButtom = "Limpar";
  const String logMessage = "Mensagem logada da tela DI!";
  const String resetStreamText = "Reiniciar Stream";
  const String finishStreamText = "Stream finalizado";
  const String calculateButtom = "Calcular";
  const String expectedPiResult = "3.1415";
  const String expectedListItem = "Item 200";
  const String goHomeButtom = "Voltar para Home";
  const String backButtomName = "Voltar";
  const String forPeopleBrandName = "for people";

  group('end-to-end test', () {
    setUpAll(() {
      setupLocator();
    });

    tearDown(() async {
      await Future.delayed(Duration(milliseconds: 100));
    });

    testWidgets('Open CustomPainter Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(
        ValueKey(RouteNames.CUSTOM_PAINTER_SCREEN.name),
      );

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.text(forPeopleBrandName), findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Router 2.0 Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(ValueKey(RouteNames.ROUTER_2.name));

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(Router2Screen), findsOneWidget);

      final telaAButton = find.byKey(ValueKey(telaAButtonKey));

      await tester.tap(telaAButton);

      await tester.pumpAndSettle();

      expect(find.byType(ScreenA), findsOneWidget);

      final backButtonA = find.text(backButtomName);

      await tester.tap(backButtonA);

      await tester.pumpAndSettle();

      final telaBButton = find.byKey(ValueKey(telaBButtonKey));

      await tester.tap(telaBButton);

      await tester.pumpAndSettle();

      expect(find.byType(ScreenB), findsOneWidget);

      final backButtonB = find.text(backButtomName);

      await tester.tap(backButtonB);

      await tester.pumpAndSettle();

      final homeButton = find.text(goHomeButtom);

      await tester.tap(homeButton);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Bloc Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(ValueKey(RouteNames.BLOC_STATE_SCREEN.name));

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(BlocStateScreen), findsOneWidget);

      final incrementButton = find.byKey(ValueKey(incrementButtonKey));

      await tester.tap(incrementButton);
      await tester.tap(incrementButton);

      await tester.pumpAndSettle();

      expect(find.text("2"), findsOneWidget);

      final decrementButton = find.byKey(ValueKey(decrementButtonKey));

      await tester.tap(decrementButton);
      await tester.tap(decrementButton);
      await tester.tap(decrementButton);

      await tester.pumpAndSettle();

      expect(find.text("0"), findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Platform Channels Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(
        ValueKey(RouteNames.PLATFORM_CHANNEL_SCREEN.name),
      );

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(PlatformChannelsScreen), findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Performance Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(ValueKey(RouteNames.PERFORMANCE_SCREEN.name));

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(PerformanceScreen), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text(expectedListItem),
        300,
        scrollable: find.byType(Scrollable),
      );

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Isolate Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(ValueKey(RouteNames.ISOLATE_SCREEN.name));

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(IsolateScreen), findsOneWidget);

      await tester.enterText(find.byKey(ValueKey(isolateTextFieldKey)), "4");

      final calculateButton = find.text(calculateButtom);

      await tester.tap(calculateButton);

      await tester.pumpAndSettle();

      expect(find.text(expectedPiResult), findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open AnimationController Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(ValueKey(RouteNames.ANIMATION_SCREEN.name));

      await tester.tap(cardItem);

      final animationScreenFinder = find.byType(AnimationScreen);

      await _pumpUntilFound(tester, animationScreenFinder);

      expect(animationScreenFinder, findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open StreamBuilder Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(
        ValueKey(RouteNames.STREAM_BUILDER_ERROR_SCREEN.name),
      );

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(StreamBuilderErrorHandlerScreen), findsOneWidget);

      await tester.pumpAndSettle();
      for (var i = 1; i < 11; i++) {
        if ([3, 7, 10].contains(i)) {
          final errorWidgetFinder = find.byType(StreamErrorHandlerWidget);
          await _pumpUntilFound(tester, errorWidgetFinder);
          expect(errorWidgetFinder, findsOneWidget);
          continue;
        }

        final textFindex = find.text(i.toString());
        await _pumpUntilFound(tester, textFindex);
        expect(textFindex, findsOneWidget);
      }

      expect(find.text(finishStreamText), findsOneWidget);

      final reestartButton = find.text(resetStreamText);
      await tester.tap(reestartButton);

      await tester.pumpAndSettle();

      final textFindex = find.text("0");
      await _pumpUntilFound(tester, textFindex);
      expect(textFindex, findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Slivers Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(ValueKey(RouteNames.SLIVER_SCREEN.name));

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(SliverScreen), findsOneWidget);
      expect(find.byType(SliverToBoxAdapter), findsOneWidget);
      expect(find.byType(SliverList), findsOneWidget);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });

    testWidgets('Open Dependency Injection Screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final cardItem = find.byKey(
        ValueKey(RouteNames.DEPENDENCY_INJECTION_SCREEN.name),
      );

      await tester.tap(cardItem);

      await tester.pumpAndSettle();

      expect(find.byType(DependencyInjectionScreen), findsOneWidget);

      final logButtonFinder = find.text(logMessageButtom);

      await tester.tap(logButtonFinder);

      await tester.pumpAndSettle();

      expect(find.text(logMessage), findsOneWidget);

      final clearButtonFinder = find.text(clearButtom);

      await tester.tap(clearButtonFinder);

      await tester.pumpAndSettle();

      expect(find.text(logMessage), findsNothing);

      final backButon = find.byIcon(Icons.arrow_back);
      await tester.tap(backButon);
      await tester.pumpAndSettle();
    });
  });
}

Future<void> _pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  final endTime = DateTime.now().add(timeout);

  while (DateTime.now().isBefore(endTime)) {
    await tester.pump(const Duration(milliseconds: 100));
    if (finder.evaluate().isNotEmpty) {
      return;
    }
  }

  throw Exception('Widget not found: $finder within $timeout');
}
