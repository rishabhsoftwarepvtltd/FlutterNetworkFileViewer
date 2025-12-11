import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rspl_network_file_viewer/src/widgets/default_header_widget.dart';

void main() {
  testWidgets(
    'DefaultHeaderWidget_whenRendered_shouldDisplayTitle',
    (WidgetTester tester) async {
      // Arrange
      const titleText = "Header Title";
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DefaultHeaderWidget(title: titleText),
          ),
        ),
      );

      // Act
      final titleFinder = find.text(titleText);

      // Assert
      expect(titleFinder, findsOneWidget); // Check if the title is displayed
    },
  );

  testWidgets(
    'DefaultHeaderWidget_whenRendered_shouldApplyCorrectStyleToTitle',
    (WidgetTester tester) async {
      // Arrange
      const titleText = "Styled Header";
      final theme = ThemeData(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: const Scaffold(
            body: DefaultHeaderWidget(title: titleText),
          ),
        ),
      );

      // Act
      final textFinder = find.text(titleText);

      // Assert
      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.fontWeight,
          FontWeight.w700); // Validate font weight
      expect(textWidget.style?.fontSize, 20); // Validate font size
      expect(textWidget.style?.color, Colors.blue); // Validate text color
    },
  );

  testWidgets(
      'DefaultHeaderWidget_whenCloseButtonPressedAndNavigatorCannotPop_shouldNotThrowError',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DefaultHeaderWidget(title: "Cannot Pop Test"),
        ),
      ),
    );

    // Act
    await tester.tap(find.byIcon(Icons.close)); // Simulate close button tap
    await tester.pumpAndSettle();

    // Assert
    // If no exception is thrown, the test passes
    expect(
      find.byType(DefaultHeaderWidget),
      findsOneWidget,
    ); // Widget remains as Navigator can't pop
  });

  testWidgets(
    'DefaultHeaderWidget_whenRendered_shouldShowCloseIcon',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DefaultHeaderWidget(title: "Close Icon Test"),
          ),
        ),
      );

      // Act
      final iconFinder = find.byIcon(Icons.close);

      // Assert
      expect(
          iconFinder, findsOneWidget); // Check if the close icon is displayed
    },
  );

  testWidgets(
    'DefaultHeaderWidget_whenRendered_shouldHaveSplashRadiusForCloseIcon',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: DefaultHeaderWidget(title: "Splash Radius Test"),
          ),
        ),
      );

      // Act
      final iconButtonFinder = find.byType(IconButton);

      // Assert
      final iconButton = tester.widget<IconButton>(iconButtonFinder);
      expect(iconButton.splashRadius,
          24.0); // Validate splash radius of the close button
    },
  );
}
