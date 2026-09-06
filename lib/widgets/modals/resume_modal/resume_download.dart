import 'resume_download_native.dart'
    if (dart.library.js_interop) 'resume_download_web.dart';

Future<bool> downloadResume(String pdfPath) {
  return downloadPlatformResume(pdfPath);
}
