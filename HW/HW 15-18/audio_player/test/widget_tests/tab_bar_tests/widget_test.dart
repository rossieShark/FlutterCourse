import 'package:animate_gradient/animate_gradient.dart';

import 'package:audio_player/screens/tab_bar/additional_widgets/animated_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomAnimatedContainer widget test',
      (WidgetTester tester) async {
    // Build the CustomAnimatedContainer widget.
    await tester.pumpWidget(
      const MaterialApp(
        home: CustomAnimatedContainer(),
      ),
    );

    // Verify that the widget is initially displayed.
    expect(find.byType(CustomAnimatedContainer), findsOneWidget);
    expect(find.byType(ClipRRect), findsOneWidget);
    expect(find.byType(AnimateGradient), findsOneWidget);

    expect(find.byType(Icon), findsOneWidget);

    // You can add more specific assertions here based on your widget's behavior.
  });
}
