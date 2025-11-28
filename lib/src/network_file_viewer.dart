import 'package:easy_image_viewer/easy_image_viewer.dart' show EasyImageView;
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart' show PDF, PDFViewTypes;
import 'package:rspl_network_file_viewer/src/constants/strings.dart' show NetworkFileViewerStrings;
import 'package:rspl_network_file_viewer/src/enum/network_file_type.dart' show NetworkFileType;
import 'package:rspl_network_file_viewer/src/widgets/default_error_widget.dart' show DefaultErrorWidget;
import 'package:rspl_network_file_viewer/src/widgets/default_header_widget.dart' show DefaultHeaderWidget;

/// A versatile viewer for loading and displaying files such as images or PDFs from a network source.
///
/// The `NetworkFileViewer` class provides functionality to view files directly from a URL.
/// It supports customization options such as headers for HTTP requests, custom headers,
/// error handling, and UI appearance to ensure flexibility and enhanced user experience.
///
/// ### Features:
/// - Support for different file types (e.g., images, PDFs).
/// - Customizable background color and content padding.
/// - Optional custom header and error widgets for a personalized UI.
/// - Ability to pass HTTP headers for secured or authenticated file access.
///
/// ### Example Usage:
/// ```dart
/// NetworkFileViewer(
///   fileType: FileType.pdf,
///   fileUrl: "https://www.example.com/sample.pdf",
///   fileName: "Sample PDF",
///   backGroundColor: Colors.white,
///   customHttpHeaders: {"Authorization": "Bearer token"},
///   errorWidget: Center(child: Text("Failed to load file")),
/// ).showViewer(context);
/// ```
///
/// This class is designed to work seamlessly in apps that require file viewing capabilities,
/// such as document viewers or media preview applications.
class NetworkFileViewer {
  /// The type of file to view (e.g., PDF or Image).
  final NetworkFileType fileType;

  /// The URL of the file to load for viewing.
  final String fileUrl;

  /// The name of the file to display in the header or as metadata.
  final String? fileName;

  /// Optional headers for HTTP requests, useful for authenticated or customized requests.
  final Map<String, String>? customHttpHeaders;

  /// The background color of the file viewer.
  /// Allows customization of the viewer's appearance.
  final Color? backGroundColor;

  /// Optional padding around the file viewer's content.
  /// Provides flexibility for spacing or layout adjustments.
  final EdgeInsetsGeometry? contentPadding;

  /// A custom widget to replace the default header.
  /// Useful for branding or adding additional controls.
  final Widget? customHeaderWidget;

  /// A widget to display in case of an error while loading the file.
  /// Enhances user experience by providing a fallback UI.
  final Widget? errorWidget;

  NetworkFileViewer({
    required this.fileType,
    required this.fileUrl,
    this.fileName,
    this.customHttpHeaders,
    this.backGroundColor,
    this.contentPadding,
    this.customHeaderWidget,
    this.errorWidget,
  }) {
    // Assertion to ensure fileName is provided if customHeaderWidget is null
    assert(customHeaderWidget != null || (fileName != null && fileName!.isNotEmpty),
        NetworkFileViewerStrings.fileNameRequiredMessage);
  }

  Future<void> showViewer(BuildContext context) async {
    Widget? bodyContentWidget;
    if (fileType == NetworkFileType.pdf) {
      bodyContentWidget = const PDF().cachedFromUrl(
        fileUrl,
        headers: customHttpHeaders,
        placeholder: (progress) => Center(
          child: Text(
            '$progress ${NetworkFileViewerStrings.progressPlaceholder}',
          ),
        ),
        // coverage:ignore-start
        errorWidget: (error) => errorWidget ?? const DefaultErrorWidget(),
        // coverage:ignore-end
      );
    } else if (fileType == NetworkFileType.image) {
      final imageProvider = Image.network(
        fileUrl,
        headers: customHttpHeaders,
        errorBuilder: (context, error, stackTrace) => errorWidget ?? const DefaultErrorWidget(),
      );

      bodyContentWidget = EasyImageView.imageWidget(
        imageProvider,
        doubleTapZoomable: true,
      );
    }

    if (bodyContentWidget != null) {
      await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        isDismissible: false,
        enableDrag: false,
        builder: (_) => _BodyWidget(
          headerWidget: customHeaderWidget ??
              DefaultHeaderWidget(
                title: fileName!,
              ),
          bodyContentWidget: Padding(
            padding: contentPadding ?? EdgeInsets.zero,
            child: bodyContentWidget!,
          ),
        ),
      );
    }
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    required this.headerWidget,
    required this.bodyContentWidget,
  });

  final Widget headerWidget;
  final Widget bodyContentWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            headerWidget,
            const SizedBox(height: 16),
            Expanded(child: bodyContentWidget),
          ],
        ),
      ),
    );
  }
}
