import 'package:flutter/material.dart';
import 'package:rspl_network_file_viewer/src/constants/strings.dart'
    show NetworkFileViewerStrings;

/// A default error widget displayed when file loading fails in [NetworkFileViewer].
///
/// This widget provides a user-friendly error display with:
/// - A prominent error icon using the theme's error color
/// - An error title ("Oops")
/// - A descriptive error message ("Something went wrong....")
///
/// The widget is fully centered and uses theme-aware colors to ensure
/// consistency with the app's design system.
///
/// ### Usage:
/// This widget is automatically used as a fallback when:
/// - A custom `errorWidget` is not provided to [NetworkFileViewer]
/// - File loading fails (network errors, invalid URLs, etc.)
///
/// ### Customization:
/// To provide a custom error widget, pass it to [NetworkFileViewer]'s
/// `errorWidget` parameter:
/// ```dart
/// NetworkFileViewer(
///   fileType: NetworkFileType.image,
///   fileUrl: "https://example.com/image.jpg",
///   fileName: "Image",
///   errorWidget: CustomErrorWidget(), // Custom error widget
/// ).showViewer(context);
/// ```
///
class DefaultErrorWidget extends StatelessWidget {
  /// Creates a default error widget.
  ///
  /// The widget displays a centered error message with an icon,
  /// title, and description using the app's theme colors.
  const DefaultErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
                size: 80,
              ),
              const SizedBox(height: 24),
              const Text(
                NetworkFileViewerStrings.errorTitle,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                NetworkFileViewerStrings.errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface.withValues(
                        alpha: 0.76,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
