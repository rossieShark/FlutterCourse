import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:audio_player/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  testWidgets('MobileTabBar widget test', (WidgetTester tester) async {
    // Build the MobileTabBar widget.

    await tester.pumpWidget(
      makeTestableWidget(
        child: MobileTabBar(
          tabIndex: 0, // Set the initial tab index for testing
          child: Container(), // Replace with the child widget you want to test
        ),
      ),
    );

    expect(find.byType(MobileTabBar), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.search), findsOneWidget);
    expect(find.byType(CustomAnimatedContainer), findsOneWidget);
  });
}

class MockTabBarBloc extends Mock implements TabBarBloc {}

Widget makeTestableWidget({required Widget child}) {
  final tabBarBloc = MockTabBarBloc();
  final mockGoRouter = MockGoRouter();

  return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: const Locale('en'),
        home: MockGoRouterProvider(
          goRouter: mockGoRouter,
          child: Provider<TabBarBloc>.value(
            value: tabBarBloc,
            child: child,
          ),
        ),
      ));
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
