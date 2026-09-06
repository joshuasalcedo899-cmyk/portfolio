import 'package:web/web.dart' as web;

Future<bool> downloadPlatformResume(String pdfPath) async {
  final pdfUri = Uri(pathSegments: ['assets', ...pdfPath.split('/')]);
  final fileName = pdfPath.split('/').last;

  final anchor = web.HTMLAnchorElement()
    ..href = pdfUri.toString()
    ..download = fileName
    ..style.setProperty('display', 'none');

  web.document.body?.appendChild(anchor);
  anchor.click();
  anchor.remove();

  return true;
}
