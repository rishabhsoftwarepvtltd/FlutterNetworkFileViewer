import 'package:flutter/material.dart';
import 'package:rspl_network_file_viewer/rspl_network_file_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Network File Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Viewer'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const [
          _FileCard(
            icon: Icons.image,
            title: 'Proper Image file',
            subtitle: 'Supports PNG, JPG, JPEG, GIF, BMP, TIFF',
            fileName: 'TrailImage.png',
            fileType: NetworkFileType.image,
            fileUrl:
                'https://st3.depositphotos.com/7865540/13723/i/450/depositphotos_137232132-stock-photo-business-communication-concept.jpg',
          ),
          _FileCard(
            icon: Icons.picture_as_pdf,
            title: 'Proper PDF file',
            subtitle: 'Supports PDF file',
            fileName: 'TrailPdfFile.pdf',
            fileType: NetworkFileType.pdf,
            fileUrl: 'https://css4.pub/2017/newsletter/drylab.pdf',
          ),
          _FileCard(
            icon: Icons.error,
            title: 'Empty or Invalid File',
            subtitle: 'File URl is Empty/Invalid or any error from file',
            fileName: 'InvalidFile.png',
            fileType: NetworkFileType.image,
            fileUrl: '',
          ),
        ],
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String fileName;
  final NetworkFileType fileType;
  final String fileUrl;

  const _FileCard({
    required this.icon,
    required this.title,
    required this.fileName,
    required this.fileType,
    required this.fileUrl,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Card(
        elevation: 0.1,
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          subtitle: (subtitle != null && subtitle!.isNotEmpty)
              ? Text(subtitle!)
              : null,
          onTap: () => _showFileViewer(context),
        ),
      ),
    );
  }

  void _showFileViewer(BuildContext context) {
    NetworkFileViewer(
      fileName: fileName,
      fileType: fileType,
      fileUrl: fileUrl,
      customHeaderWidget: ImageHeaderWidget(
        title: fileName,
      ),
      errorWidget: const FileErrorWidget(),
    ).showViewer(context);
  }
}

class PdfHeaderWidget extends StatelessWidget {
  final String title;
  const PdfHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

class ImageHeaderWidget extends StatelessWidget {
  final String title;
  const ImageHeaderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}

class FileErrorWidget extends StatelessWidget {
  const FileErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.warning, size: 80, color: Colors.amber),
        SizedBox(height: 24),
        Center(
          child: Text(
            'Error!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Center(
          child: Text(
            'Image not found',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
