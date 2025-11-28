import 'package:flutter/material.dart';

/// A default header widget displayed at the top of the [NetworkFileViewer].
///
/// This widget provides a simple, clean header with:
/// - A file title/name displayed prominently
/// - A close button to dismiss the viewer
///
/// The widget uses theme-aware styling and automatically handles navigation
/// to close the file viewer when the close button is pressed.
///
/// ### Usage:
/// This widget is automatically used as a fallback when:
/// - A custom `customHeaderWidget` is not provided to [NetworkFileViewer]
/// - The `fileName` parameter is provided to [NetworkFileViewer]
///
/// ### Customization:
/// To provide a custom header widget, pass it to [NetworkFileViewer]'s
/// `customHeaderWidget` parameter:
/// ```dart
/// NetworkFileViewer(
///   fileType: NetworkFileType.image,
///   fileUrl: "https://example.com/image.jpg",
///   fileName: "Image",
///   customHeaderWidget: CustomHeaderWidget(), // Custom header widget
/// ).showViewer(context);
/// ```
///
/// ### Navigation:
/// The close button safely checks if navigation is possible before popping,
/// preventing errors when the viewer is the root route.
class DefaultHeaderWidget extends StatelessWidget {
  /// The title to display in the header (typically the file name).
  ///
  /// This title is displayed prominently and will be truncated with ellipsis
  /// if it exceeds 2 lines.
  final String title;

  /// Creates a default header widget with the specified title.
  ///
  /// The [title] parameter is required and will be displayed as the header text.
  /// The widget includes a close button that safely navigates back when pressed.
  const DefaultHeaderWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () {
              final navigatorState = Navigator.of(context);
              // coverage:ignore-start
              if (navigatorState.canPop()) {
                navigatorState.pop();
              }
              // coverage:ignore-end
            },
            splashRadius: 24.0,
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
