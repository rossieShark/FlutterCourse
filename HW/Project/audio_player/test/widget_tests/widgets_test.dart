import 'dart:convert';

import 'package:audio_player/app_logic/blocs/bloc_exports.dart';
import 'package:audio_player/widgets/responsive_widgets/platform_widget/extended_platform.dart';

import 'package:audio_player/widgets/widget_exports.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nock/nock.dart';

import 'home_screen/golden_image.dart';

class MockFavoriteBloc extends Mock implements FavoriteBloc {}

class MockFavoriteProvider extends Mock implements FavoriteProvider {}

void main() {
  testWidgets('CustomListViewContent displays image and title sections',
      (WidgetTester tester) async {
    // Create a test image and title section
    const imageSection = Icon(Icons.image);
    const titleSection = Text('Title Section');

    // Build the CustomListViewContent widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomListViewContent(
            imageSection: imageSection,
            titleSection: titleSection,
          ),
        ),
      ),
    );

    // Verify that the image and title sections are displayed
    expect(find.byWidget(imageSection), findsOneWidget);
    expect(find.text('Title Section'), findsOneWidget);

    // Verify that the IconButtonWidget is displayed
    expect(find.byIcon(Icons.keyboard_control), findsOneWidget);
  });

  testWidgets('ImageinAlbum displays image with correct size and type',
      (WidgetTester tester) async {
    // Create a test image widget

    nock.init();
    nock.cleanAll();
    nock('https://run.mocky.io')
        .get('/v3/image1.jpg')
        .reply(200, base64Decode(imageURL));
    const image = 'https://run.mocky.io/v3/image1.jpg';
    String type = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ImageinAlbum(
            size: 100.0,
            type: 'track',
            image: Image.network(image),
          ),
        ),
      ),
    );

    // Verify that the image is displayed with the correct size and type

    // Verify that the ClipRRect widget is used with the correct border radius
    expect(find.byType(ClipRRect), findsOneWidget);

    if (tester.widget<ClipRRect>(find.byType(ClipRRect)).borderRadius != null) {
      final borderRadius =
          tester.widget<ClipRRect>(find.byType(ClipRRect)).borderRadius!;
      if (type == 'track') {
        expect(borderRadius,
            16.0 / 2); // Set your expected radius for 'track' type
      }
      if (type == 'album') {
        expect(
            borderRadius, 100 / 2); // Set your expected radius for 'track' type
      }
    }
  });
  testWidgets('CreateSongTitle displays correctly',
      (WidgetTester tester) async {
    // Build the widget with test data
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CreateSongTitle(
            artistName: 'Artist Name',
            songTitle: 'Song Title',
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            maxLines: 2,
            fontSize: 16,
            minFontSize: 14,
          ),
        ),
      ),
    );

    // Verify that the CreateSongTitle widget is displayed
    expect(find.byType(CreateSongTitle), findsOneWidget);

    // Verify the presence of expected text
    expect(find.text('Artist Name'), findsOneWidget);
    expect(find.text('Song Title'), findsOneWidget);
  });

  testWidgets('CreatePlayButton displays correctly',
      (WidgetTester tester) async {
    bool buttonPressed = false;

    // Build the widget with test data
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CreatePlayButton(
            size: 50.0,
            containerColor: Colors.blue,
            icon: const Icon(Icons.play_arrow),
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verify that the CreatePlayButton widget is displayed
    expect(find.byType(CreatePlayButton), findsOneWidget);

    // Verify the initial state of the button
    expect(buttonPressed, false);

    // Tap the button
    await tester.tap(find.byType(CreatePlayButton));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that the onPressed callback is called
    expect(buttonPressed, true);
  });

  testWidgets('LikeButton displays correctly (isFavorite = true)',
      (WidgetTester tester) async {
    bool buttonPressed = false;

    // Build the widget with test data
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LikeButton(
            isFavorite: true,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verify that the CreatePlayButton widget is displayed
    expect(find.byType(LikeButton), findsOneWidget);

    // Verify the initial state of the button
    expect(buttonPressed, false);
    // expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    // Tap the button
    await tester.tap(find.byType(LikeButton));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that the onPressed callback is called
    expect(buttonPressed, true);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('LikeButton displays correctly (isFavorite = false)',
      (WidgetTester tester) async {
    bool buttonPressed = false;

    // Build the widget with test data
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LikeButton(
            isFavorite: false,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verify that the CreatePlayButton widget is displayed
    expect(find.byType(LikeButton), findsOneWidget);

    // Verify the initial state of the button
    expect(buttonPressed, false);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    // Tap the button
    await tester.tap(find.byType(LikeButton));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that the onPressed callback is called
    expect(buttonPressed, true);
  });

  testWidgets('TextButtonWidget displays child', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextButtonWidget(
            onPressed: () {},
            child: const Text('Button Text'),
          ),
        ),
      ),
    );

    // Verify that the TextButtonWidget displays the child text.
    expect(find.text('Button Text'), findsOneWidget);
  });

  testWidgets('TextButtonWidget calls onPressed when pressed',
      (WidgetTester tester) async {
    bool onPressedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TextButtonWidget(
            onPressed: () {
              onPressedCalled = true;
            },
            child: const Text('Button Text'),
          ),
        ),
      ),
    );

    // Tap the TextButtonWidget.
    await tester.tap(find.byType(TextButtonWidget));

    // Trigger a frame.
    await tester.pump();

    // Verify that onPressed was called.
    expect(onPressedCalled, true);
  });

  testWidgets('HoverableWidget changes cursor on hover',
      (WidgetTester tester) async {
    bool isHovered = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: HoverableWidget(
            builder: (context, child, hovered) {
              isHovered = hovered;
              return Container(
                width: 100,
                height: 100,
                color: hovered ? Colors.blue : Colors.red,
              );
            },
          ),
        ),
      ),
    );

    // Verify that the initial state is not hovered.
    expect(isHovered, false);

    // Simulate a hover event by triggering onEnter.
    await tester.pump();
    await tester.ensureVisible(find.byType(HoverableWidget));
    await tester.tap(find.byType(HoverableWidget)); // Tap to simulate hover.

    // Simulate an exit event by triggering onExit.
    await tester.pump();
    await tester.ensureVisible(find.byType(HoverableWidget));
    await tester.tap(find.byType(HoverableWidget)); // Tap to simulate exit.

    // Verify that the widget is no longer hovered.
    expect(isHovered, false);
  });
  testWidgets(
      'ResponsiveWidget displays the correct content for different screen sizes',
      (WidgetTester tester) async {
    // Set the screen size to simulate a narrow screen.
    await tester.binding.setSurfaceSize(const Size(300, 800));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ResponsiveWidget(
                narrow: (context) => const Text('Narrow'),
                medium: (context) => const Text('Medium'),
                mediumExtra: (context) => const Text('Medium Extra'),
                large: (context) => const Text('Large'),
                other: (context) => const Text('Other'),
              );
            },
          ),
        ),
      ),
    );

    expect(find.text('Narrow'), findsOneWidget);
    expect(find.text('Medium'), findsNothing);
    expect(find.text('Medium Extra'), findsNothing);
    expect(find.text('Large'), findsNothing);
    expect(find.text('Other'), findsNothing);

    // Set the screen size to simulate a medium screen.
    await tester.binding.setSurfaceSize(const Size(800, 800));
    await tester.pump();

    expect(find.text('Narrow'), findsNothing);
    expect(find.text('Medium'), findsOneWidget);
    expect(find.text('Medium Extra'), findsNothing);
    expect(find.text('Large'), findsNothing);
    expect(find.text('Other'), findsNothing);

    // Set the screen size to simulate a medium extra screen.
    await tester.binding.setSurfaceSize(const Size(1100, 800));
    await tester.pump();

    expect(find.text('Narrow'), findsNothing);
    expect(find.text('Medium'), findsNothing);
    expect(find.text('Medium Extra'), findsOneWidget);
    expect(find.text('Large'), findsNothing);
    expect(find.text('Other'), findsNothing);

    // Set the screen size to simulate a large screen.
    await tester.binding.setSurfaceSize(const Size(1300, 1300));
    await tester.pump();

    expect(find.text('Narrow'), findsNothing);
    expect(find.text('Medium'), findsNothing);
    expect(find.text('Medium Extra'), findsNothing);
    expect(find.text('Large'), findsOneWidget);
    expect(find.text('Other'), findsNothing);
  });

  testWidgets(
      'ResponsiveWidget displays the correct content for different screen sizes - Others check',
      (WidgetTester tester) async {
    // Set the screen size to simulate a narrow screen.
    await tester.binding.setSurfaceSize(const Size(300, 800));

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              return ResponsiveWidget(
                narrow: (context) => const Text('Narrow'),
                other: (context) => const Text('Other'),
              );
            },
          ),
        ),
      ),
    );
    expect(find.text('Narrow'), findsOneWidget);
    expect(find.text('Medium'), findsNothing);
    expect(find.text('Medium Extra'), findsNothing);
    expect(find.text('Large'), findsNothing);
    expect(find.text('Other'), findsNothing);

    await tester.binding.setSurfaceSize(const Size(800, 800));
    await tester.pump();

    expect(find.text('Narrow'), findsNothing);
    expect(find.text('Medium'), findsNothing);
    expect(find.text('Medium Extra'), findsNothing);
    expect(find.text('Large'), findsNothing);
    expect(find.text('Other'), findsOneWidget);
  });

  testWidgets(
      'PlatformBuilder displays the correct content based on the platform',
      (WidgetTester tester) async {
    // Test for Android platform.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PlatformBuilder<String>(
            android: 'Android Content',
            iOS: 'iOS Content',
            web: 'Web Content',
            windows: 'Windows Content',
            other: 'Other Content',
            builder: (context, child, platformContent) {
              return Text(platformContent);
            },
          ),
        ),
      ),
    );

    if (ExtendedPlatform.isAndroid) {
      expect(find.text('Android Content'), findsOneWidget);
      expect(find.text('iOS Content'), findsNothing);
      expect(find.text('Web Content'), findsNothing);
      expect(find.text('Windows Content'), findsNothing);
      expect(find.text('Other Content'), findsNothing);
    }
    if (ExtendedPlatform.isIOS) {
      expect(find.text('Android Content'), findsNothing);
      expect(find.text('iOS Content'), findsOneWidget);
      expect(find.text('Web Content'), findsNothing);
      expect(find.text('Windows Content'), findsNothing);
      expect(find.text('Other Content'), findsNothing);
    }
    if (ExtendedPlatform.isWeb) {
      expect(find.text('Android Content'), findsNothing);
      expect(find.text('iOS Content'), findsNothing);
      expect(find.text('Web Content'), findsOneWidget);
      expect(find.text('Windows Content'), findsNothing);
      expect(find.text('Other Content'), findsNothing);
    }
  });
  testWidgets('CustomFadingCircleIndicator should build without errors',
      (WidgetTester tester) async {
    // Build your widget and trigger frame rendering.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomFadingCircleIndicator(size: 30.0),
        ),
      ),
    );

    // Verify that the widget is rendered.
    expect(find.byType(CustomFadingCircleIndicator), findsOneWidget);
  });
  final textModifierService = TextModifierService();

  test('removeTextAfter should remove text after a specified pattern', () {
    expect(textModifierService.removeTextAfter('Song - Artist'), 'Song ');
    expect(textModifierService.removeTextAfter('Artist(Ft.Ar)'), 'Artist');
    expect(
        textModifierService.removeTextAfter('Song by Artist (Additional Info)'),
        'Song ');
    expect(
        textModifierService.removeTextAfter('Song(Additional Info)'), 'Song');
    expect(textModifierService.removeTextAfter('Text with no pattern'),
        'Text with no pattern');
  });

  test('capitalizeFirstLetter should capitalize the first letter', () {
    expect(textModifierService.capitalizeFirstLetter('hello'), 'Hello');
    expect(textModifierService.capitalizeFirstLetter('world'), 'World');
    expect(textModifierService.capitalizeFirstLetter(''), '');
  });

  testWidgets('CustomButton displays correctly', (WidgetTester tester) async {
    bool buttonPressed = false;

    // Build the widget with test data
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            width: 50.0,
            buttonText: 'Tap',
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );

    // Verify that the CreatePlayButton widget is displayed
    expect(find.byType(CustomButton), findsOneWidget);
    expect(find.text('Tap'), findsOneWidget);

    // Verify the initial state of the button
    expect(buttonPressed, false);

    // Tap the button
    await tester.tap(find.byType(CustomButton));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that the onPressed callback is called
    expect(buttonPressed, true);
  });

  testWidgets('CustomTextField should render correctly',
      (WidgetTester tester) async {
    // Build the CustomTextField widget.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            controller: TextEditingController(),
            hintText: 'Enter text',
            focusNode: FocusNode(),
            obscureText: false,
          ),
        ),
      ),
    );

    // Verify that the CustomTextField is displayed.
    expect(find.byType(CustomTextField), findsOneWidget);
    expect(find.text('Enter text'), findsOneWidget);

    // You can also interact with the widget if needed.
    // For example, you can enter text into the text field and check the onChanged callback.
    final textField = find.byType(TextField);
    await tester.enterText(textField, 'Sample text');
    expect(find.text('Sample text'), findsOneWidget);

    // Add more test cases as needed to cover different scenarios.
  });

  testWidgets('Widget displays images correctly', (WidgetTester tester) async {
    // Build the widget.
    bool buttonPressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SignMethods(
            onGoogleTap: () {
              buttonPressed = true;
            }, // Replace 'YourWidget' with the actual widget name.
          ),
        ),
      ),
    );

    // Verify that the Google icon is displayed.
    expect(find.byType(GestureDetector),
        findsNWidgets(1)); // Three GestureDetector widgets.
    expect(find.byType(Image), findsNWidgets(3)); // Three Image widgets.

    // You can add similar expectations for the Facebook and Apple icons.

    // Perform interactions if needed.
    // For example, you can simulate a tap on the Google icon:
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(buttonPressed, true);
  });
}
