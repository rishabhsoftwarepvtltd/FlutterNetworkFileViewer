/// Enum representing the supported network file types for the NetworkFileViewer.
///
/// This enum defines the types of files that can be displayed by the
/// [NetworkFileViewer] widget. Each type determines how the file is loaded
/// and rendered in the viewer.
///
/// ### Supported File Types:
/// - [NetworkFileType.image]: For image files (PNG, JPG, JPEG, GIF, BMP, TIFF, etc.)
/// - [NetworkFileType.pdf]: For PDF documents
///
/// ### Usage Example:
/// ```dart
/// NetworkFileViewer(
///   fileType: NetworkFileType.image,
///   fileUrl: "https://example.com/image.jpg",
///   fileName: "Sample Image",
/// ).showViewer(context);
/// ```
enum NetworkFileType {
  /// Image file type.
  ///
  /// Supports common image formats including:
  /// - PNG (Portable Network Graphics)
  /// - JPG/JPEG (Joint Photographic Experts Group)
  /// - GIF (Graphics Interchange Format)
  /// - BMP (Bitmap)
  /// - TIFF (Tagged Image File Format)
  ///
  /// Images are displayed using [EasyImageView] with double-tap zoom functionality.
  image,

  /// PDF document file type.
  ///
  /// Supports PDF (Portable Document Format) files.
  ///
  /// PDFs are displayed using [flutter_cached_pdfview] with caching support
  /// for improved performance and offline access.
  pdf,
}
