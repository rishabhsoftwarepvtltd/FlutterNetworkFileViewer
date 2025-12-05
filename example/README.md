# RSPL Network File Viewer - Example App

This example app demonstrates how to use the `rspl_network_file_viewer` package to display images and PDFs from network URLs.

## Overview

The example app showcases various use cases of the `NetworkFileViewer` widget, including:

- Displaying images from network URLs
- Displaying PDFs from network URLs
- Error handling for invalid or empty URLs
- Custom header widgets
- Custom error widgets

## Getting Started

### Prerequisites

- Flutter SDK (3.24.0 or higher)
- Dart SDK (3.4.0 or higher)
- Android Studio / Xcode (for running on device/emulator)

### Running the Example

1. Navigate to the example directory:
   ```bash
   cd example
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Example Features

### 1. Image Viewer Example

The first example demonstrates viewing an image file from a network URL:

- **File Type**: Image (PNG, JPG, JPEG, GIF, BMP, TIFF)
- **Features**:
  - Double-tap zoom functionality
  - Pinch-to-zoom gestures
  - Custom header widget with back button
  - Custom error widget

**Code Example:**
```dart
NetworkFileViewer(
  fileName: 'TrailImage.png',
  fileType: NetworkFileType.image,
  fileUrl: 'https://example.com/image.jpg',
  customHeaderWidget: ImageHeaderWidget(
    title: 'TrailImage.png',
  ),
  errorWidget: const FileErrorWidget(),
).showViewer(context);
```

### 2. PDF Viewer Example

The second example demonstrates viewing a PDF file from a network URL:

- **File Type**: PDF
- **Features**:
  - Built-in PDF caching
  - Offline access support
  - Custom header widget with close button
  - Custom error widget

**Code Example:**
```dart
NetworkFileViewer(
  fileName: 'TrailPdfFile.pdf',
  fileType: NetworkFileType.pdf,
  fileUrl: 'https://example.com/document.pdf',
  customHeaderWidget: PdfHeaderWidget(
    title: 'TrailPdfFile.pdf',
  ),
  errorWidget: const FileErrorWidget(),
).showViewer(context);
```

### 3. Error Handling Example

The third example demonstrates error handling when the file URL is empty or invalid:

- **Purpose**: Shows how the package handles errors gracefully
- **Features**:
  - Custom error widget display
  - User-friendly error messages
  - Proper error state management

## Custom Widgets

The example includes several custom widgets that demonstrate the flexibility of the package:

### ImageHeaderWidget

A custom header widget for image viewing with:
- Back button for navigation
- File name display
- Custom styling

```dart
class ImageHeaderWidget extends StatelessWidget {
  final String title;
  // ... implementation
}
```

### PdfHeaderWidget

A custom header widget for PDF viewing with:
- Close button for navigation
- File name display
- Custom styling

```dart
class PdfHeaderWidget extends StatelessWidget {
  final String title;
  // ... implementation
}
```

### FileErrorWidget

A custom error widget that displays:
- Warning icon
- Error title
- Error message
- Centered layout

```dart
class FileErrorWidget extends StatelessWidget {
  // ... implementation
}
```

## App Structure

```
example/
├── lib/
│   └── main.dart          # Main example app code
├── android/               # Android platform files
├── ios/                   # iOS platform files
└── README.md             # This file
```

## Key Implementation Details

### Main App (`MyApp`)

- Material Design 3 theme
- Clean, minimal setup
- Routes to `ExamplePage`

### Example Page (`ExamplePage`)

- Displays a list of file cards
- Each card represents a different use case
- Tapping a card opens the file viewer

### File Card (`_FileCard`)

- Reusable card widget
- Displays file type icon
- Shows title and subtitle
- Handles tap to open viewer

## Testing Different Scenarios

You can modify the example to test:

1. **Different Image Formats**: Change the `fileUrl` to test PNG, JPG, GIF, etc.
2. **Different PDF Sources**: Use various PDF URLs to test caching
3. **Authentication**: Add `customHttpHeaders` with Bearer tokens
4. **Custom Styling**: Modify `backGroundColor` and `contentPadding`
5. **Error Cases**: Test with invalid URLs, network errors, etc.

## Notes

- The example uses public URLs for demonstration purposes
- In production, ensure you have proper error handling for network failures
- Custom headers can be added for authenticated file access
- The package automatically handles caching for PDFs

## Troubleshooting

If you encounter issues:

1. **Network Errors**: Ensure you have internet connectivity
2. **Platform Issues**: Check that you have the required permissions (INTERNET on Android)
3. **Build Errors**: Run `flutter clean` and `flutter pub get`
4. **iOS Issues**: Run `pod install` in the `ios` directory if needed

## Related Documentation

For more information, see the main package [README](../README.md).

---

**Made with ❤️ by [RSPL Team](https://www.rishabhsoft.com/services/mobile-app-development)**

