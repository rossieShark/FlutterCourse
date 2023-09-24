import 'package:audio_player/flutter_gen/gen_l10n/app_localizations.dart';

import 'package:audio_player/screens/log_pages/sign_up_screen.dart';
import 'package:audio_player/widgets/widget_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SignUpPage widgets and interactions',
      (WidgetTester tester) async {
    // Build the SignInPage widget.
    await tester.pumpWidget(makeTestableWidget(child: const SignUpPage()));

    // Verify that the initial state is as expected.
    expect(find.text('Enter email'), findsOneWidget);
    expect(find.text('Enter password'), findsOneWidget);

    // Simulate user interactions.
    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.text(' Sign Up'));
    await tester.pumpAndSettle();

    // // Verify that the expected interactions have occurred.
    expect(find.byType(CustomButton), findsOneWidget);
    expect(find.text("Already have an account? "), findsOneWidget);
    expect(find.text(' Sign In'), findsOneWidget);

    // You can add more test scenarios and assertions as needed.
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
