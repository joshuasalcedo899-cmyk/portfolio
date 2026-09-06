import 'package:flutter/material.dart';

import 'pdf_viewer_native.dart'
    if (dart.library.js_interop) 'pdf_viewer_web.dart';

class PdfView extends StatelessWidget {
  final String pdfPath;

  const PdfView({
    super.key,
    required this.pdfPath,
  });

  @override
  Widget build(BuildContext context) {
    return PlatformPdfView(pdfPath: pdfPath);
  }
}
