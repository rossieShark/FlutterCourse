import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/screens/index.dart';
import 'package:audio_player/screens/tab_bar/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('IPadTabBar widget test', (WidgetTester tester) async {
    // Build the IPadTabBar widget.
    await tester.pumpWidget(
      makeTestableWidget(
        child: IPadTabBar(
          tabIndex: 1, // Set the initial tab index as needed.
          child: Container(), // Replace with your actual child widget.
        ),
      ),
    );

    // Verify that the widget is initially displayed.
    expect(find.byType(IPadTabBar), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(NavigationRail), findsOneWidget);

    // You can add more specific assertions here based on your widget's behavior.
  });
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

class MockTabBarBloc extends Mock implements TabBarBloc {}

Widget makeTestableWidget({required Widget child}) {
  final tabBarBloc = MockTabBarBloc();
  return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: const Locale('en'),
        home: Provider<TabBarBloc>.value(
          value: tabBarBloc,
          child: child,
        ),
      ));
}
