import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

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
  late final String _viewType = 'pdf-view-${identityHashCode(this)}';

  @override
  void initState() {
    super.initState();

    final pdfUri = Uri(
      pathSegments: ['assets', ...widget.pdfPath.split('/')],
      fragment: 'toolbar=0&navpanes=0',
    );

    ui_web.platformViewRegistry.registerViewFactory(_viewType, (_) {
      return web.HTMLIFrameElement()
        ..src = pdfUri.toString()
        ..style.border = '0'
        ..style.height = '100%'
        ..style.width = '100%'
        ..setAttribute('title', 'Resume PDF');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: HtmlElementView(viewType: _viewType),
    );
  }
}
