import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/screens/log_pages/start_page.dart';
import 'package:audio_player/screens/tab_bar/additional_widgets/navigation_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('StartPage widgets and interactions',
      (WidgetTester tester) async {
    final mockGoRouter = MockGoRouter();
    // Build the SignInPage widget.
    await tester.pumpWidget(makeTestableWidget(
        child: MockGoRouterProvider(
            goRouter: mockGoRouter, child: const StartPage())));

    // Verify that the initial state is as expected.
    expect(find.text('Louder'), findsOneWidget);
    expect(
        find.text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
        findsOneWidget);

    // Simulate user interactions.

    await tester.tap(find.text(' Sign In'));
    //  await tester.tap(find.text(' Sign Up'));
    await tester.pumpAndSettle();

    // // Verify that the expected interactions have occurred.
    //  expect(find.byWidget(CustomButton()), 2);
    expect(find.text(" Sign In"), findsOneWidget);
    expect(find.text(' Sign Up'), findsOneWidget);
    verify(() => mockGoRouter.go(routeNameMap[RouteName.sigIn]!)).called(1);
    verifyNever(() => mockGoRouter.go(routeNameMap[RouteName.signUp]!));
    // You can add more test scenarios and assertions as needed.

    await tester.tap(find.text(' Sign Up'));
    //  await tester.tap(find.text(' Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text(' Sign Up'), findsOneWidget);
    verify(() => mockGoRouter.go(routeNameMap[RouteName.signUp]!)).called(1);
  });
}

Widget makeTestableWidget({required Widget child}) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('en'),
      home: child,
    ),
  );
}

class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterProvider extends StatelessWidget {
  const MockGoRouterProvider({
    required this.goRouter,
    required this.child,
    Key? key,
  }) : super(key: key);

  /// The mock navigator used to mock navigation calls.
  final MockGoRouter goRouter;

  /// The child [Widget] to render.
  final Widget child;

  @override
  Widget build(BuildContext context) => InheritedGoRouter(
        goRouter: goRouter,
        child: child,
      );
}
