import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rspl_network_file_viewer/src/constants/strings.dart' show NetworkFileViewerStrings;
import 'package:rspl_network_file_viewer/src/widgets/default_error_widget.dart';

void main() {
  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldShowErrorIcon',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultErrorWidget(),
        ),
      );

      // Act
      final iconFinder = find.byIcon(Icons.error_outline);

      // Assert
      expect(iconFinder, findsOneWidget); // Check that the error icon is displayed
    },
  );

  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldShowErrorTitle',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultErrorWidget(),
        ),
      );

      // Act
      final titleFinder = find.text(NetworkFileViewerStrings.errorTitle);

      // Assert
      expect(titleFinder, findsOneWidget); // Check that the error title is displayed
    },
  );

  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldShowErrorMessage',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultErrorWidget(),
        ),
      );

      // Act
      final messageFinder = find.text(NetworkFileViewerStrings.errorMessage);

      // Assert
      expect(messageFinder, findsOneWidget); // Check that the error message is displayed
    },
  );

  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldHaveProperPadding',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultErrorWidget(),
        ),
      );

      // Act
      final paddingFinder = find.byType(Padding);

      // Assert
      expect(paddingFinder, findsWidgets); // Check if Padding widget exists
      final paddingWidget = tester.widget<Padding>(paddingFinder.first);
      expect(paddingWidget.padding, const EdgeInsets.all(24.0)); // Validate padding value
    },
  );

  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldHaveProperTextStyles',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultErrorWidget(),
        ),
      );

      // Act
      final titleTextFinder = find.text(NetworkFileViewerStrings.errorTitle);
      final messageTextFinder = find.text(NetworkFileViewerStrings.errorMessage);

      // Assert
      final titleText = tester.widget<Text>(titleTextFinder);
      expect(
        titleText.style,
        const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ); // Validate title text style

      final messageText = tester.widget<Text>(messageTextFinder);
      expect(messageText.style?.fontSize, 16); // Validate font size of the message
    },
  );

  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldCenterContent',
    (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(
          home: DefaultErrorWidget(),
        ),
      );

      // Act
      final columnFinder = find.byType(Column);

      // Assert
      final columnWidget = tester.widget<Column>(columnFinder);
      expect(columnWidget.mainAxisAlignment, MainAxisAlignment.center); // Validate vertical centering
      expect(columnWidget.crossAxisAlignment, CrossAxisAlignment.center); // Validate horizontal centering
    },
  );

  testWidgets(
    'DefaultErrorWidget_whenRendered_shouldUseThemeColors',
    (WidgetTester tester) async {
      // Arrange
      final theme = ThemeData(
        colorScheme: const ColorScheme.light(
          error: Colors.red,
          onSurface: Colors.grey,
        ),
      );
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: const DefaultErrorWidget(),
        ),
      );

      // Act
      final iconFinder = find.byIcon(Icons.error_outline);
      final messageTextFinder = find.text(NetworkFileViewerStrings.errorMessage);

      // Assert
      final icon = tester.widget<Icon>(iconFinder);
      expect(icon.color, theme.colorScheme.error); // Validate error color for icon

      final messageText = tester.widget<Text>(messageTextFinder);
      expect(
          messageText.style?.color, theme.colorScheme.onSurface.withValues(alpha: 0.76)); // Validate message text color
    },
  );
}
