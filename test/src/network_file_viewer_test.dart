import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rspl_network_file_viewer/src/enum/network_file_type.dart';
import 'package:rspl_network_file_viewer/src/network_file_viewer.dart';

void main() {
  testWidgets(
    'NetworkFileViewer_whenNoFileNameAndNoCustomHeaderWidget_shouldThrowAssertionError',
    (WidgetTester tester) async {
      // Arrange
      const fileUrl = "https://www.example.com/sample.jpg";

      // Act & Assert
      expect(
        () => NetworkFileViewer(
          fileType: NetworkFileType.image,
          fileUrl: fileUrl,
          customHttpHeaders: {"Authorization": "Bearer token"},
          errorWidget: const Center(child: Text("Failed to load file")),
        ),
        throwsAssertionError, // Expecting an assertion error due to missing fileName and customHeaderWidget
      );
    },
  );

  testWidgets(
    'NetworkFileViewer_whenFileTypeIsImage_shouldLoadErrorView',
    (WidgetTester tester) async {
      // Arrange
      const fileUrl = "https://invalid";
      final viewer = NetworkFileViewer(
        fileType: NetworkFileType.image,
        fileUrl: fileUrl,
        fileName: "Sample Image",
        backGroundColor: Colors.white,
        customHttpHeaders: {"Authorization": "Bearer token"},
        errorWidget: const Center(child: Text("Failed to load file")),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => viewer.showViewer(context),
                child: const Text("Open Image Viewer"),
              );
            },
          ),
        ),
      );

      // Simulate button press
      await tester.tap(find.text("Open Image Viewer"));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Failed to load file"), findsOneWidget);
    },
  );

  testWidgets(
    'NetworkFileViewer_whenFileTypeIsImage_shouldLoadImageViewer',
    (WidgetTester tester) async {
      // Arrange
      const fileUrl = "https://www.example.com/sample.jpg";
      final viewer = NetworkFileViewer(
        fileType: NetworkFileType.image,
        fileUrl: fileUrl,
        fileName: "Sample Image",
        backGroundColor: Colors.white,
        customHttpHeaders: {"Authorization": "Bearer token"},
        errorWidget: const Center(child: Text("Failed to load file")),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => viewer.showViewer(context),
                child: const Text("Open Image Viewer"),
              );
            },
          ),
        ),
      );

      // Simulate button press
      await tester.tap(find.text("Open Image Viewer"));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Sample Image"), findsOneWidget);
    },
  );

  testWidgets(
    'NetworkFileViewer_whenFileTypeIsPdf_shouldLoadPdfViewer',
    (WidgetTester tester) async {
      // Arrange
      const fileUrl = "https://css4.pub/2017/newsletter/drylab.pdf";
      final viewer = NetworkFileViewer(
        fileType: NetworkFileType.pdf,
        fileUrl: fileUrl,
        fileName: "Sample PDF",
        backGroundColor: Colors.white,
        customHttpHeaders: {"Authorization": "Bearer token"},
        errorWidget: const Center(child: Text("Failed to load file")),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => viewer.showViewer(context),
                child: const Text("Open PDF Viewer"),
              );
            },
          ),
        ),
      );

      // Simulate button press
      await tester.tap(find.text("Open PDF Viewer"));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text("Sample PDF"), findsOneWidget);
    },
  );

  testWidgets(
    'NetworkFileViewer_whenCustomHeaderWidgetIsProvided_shouldDisplayCustomHeader',
    (WidgetTester tester) async {
      // Arrange
      const fileUrl = "https://www.example.com/sample.jpg";
      const customHeader = Text("Custom Header");

      final viewer = NetworkFileViewer(
        fileType: NetworkFileType.image,
        fileUrl: fileUrl,
        fileName: "Sample Image",
        customHeaderWidget: customHeader,
        backGroundColor: Colors.white,
        customHttpHeaders: {"Authorization": "Bearer token"},
        errorWidget: const Center(child: Text("Failed to load file")),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => viewer.showViewer(context),
                child: const Text("Open Viewer"),
              );
            },
          ),
        ),
      );

      // Simulate button press
      await tester.tap(find.text("Open Viewer"));
      await tester.pumpAndSettle();

      // Assert: Check if the custom header widget is displayed
      expect(find.text("Custom Header"), findsOneWidget);
    },
  );

  testWidgets(
    'NetworkFileViewer_whenErrorOccurs_shouldShowErrorWidget',
    (WidgetTester tester) async {
      // Arrange
      const fileUrl = "";
      final viewer = NetworkFileViewer(
        fileType: NetworkFileType.image,
        fileUrl: fileUrl,
        fileName: "Nonexistent Image",
        backGroundColor: Colors.white,
        customHttpHeaders: {"Authorization": "Bearer token"},
        errorWidget: const Center(child: Text("Failed to load file")),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () => viewer.showViewer(context),
                child: const Text("Open Viewer"),
              );
            },
          ),
        ),
      );

      // Simulate button press
      await tester.tap(find.text("Open Viewer"));
      await tester.pumpAndSettle();

      // Assert: Check if the error widget is displayed when file fails to load
      expect(find.text("Failed to load file"), findsOneWidget);
    },
  );
}
