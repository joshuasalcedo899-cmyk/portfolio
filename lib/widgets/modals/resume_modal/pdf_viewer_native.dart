import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PlatformPdfView extends StatefulWidget {
  final String pdfPath;

  const PlatformPdfView({
    super.key,
    required this.pdfPath,
  });

  @override
  State<PlatformPdfView> createState() => _PlatformPdfViewState();
}

class _PlatformPdfViewState extends State<PlatformPdfView> {
  String? _loadError;

  @override
  Widget build(BuildContext context) {
    if (_loadError != null) {
      return Center(
        child: Text(
          _loadError!,
          textAlign: TextAlign.center,
        ),
      );
    }

    return SfPdfViewer.asset(
      widget.pdfPath,
      onDocumentLoaded: (_) {
        if (_loadError == null) {
          return;
        }

        setState(() => _loadError = null);
      },
      onDocumentLoadFailed: (details) {
        setState(() {
          _loadError = '${details.error}\n${details.description}';
        });
      },
    );
  }
}
