import 'package:example/custom_headers.dart';
import 'package:flutter/material.dart';
import 'package:rspl_network_file_viewer/rspl_network_file_viewer.dart';

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
            fileName: 'TrailImage.jpg',
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
          subtitle: (subtitle != null && subtitle!.isNotEmpty) ? Text(subtitle!) : null,
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
