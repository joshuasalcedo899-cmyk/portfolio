import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/widgets/modals/apple_dialog_scaffold.dart';
import 'package:flutter_testing/widgets/modals/resume_modal/pdf_viewer.dart';
import 'package:flutter_testing/widgets/modals/resume_modal/resume_download.dart';

const _resumePdfPath = 'assets/Docs/resume.pdf';

class ResumeView extends StatelessWidget {
  const ResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppleDialogScaffold(
      title: 'RESUME',
      maxWidth: 850,
      backgroundColor: Colors.transparent,
      actions: const [_ResumeDownloadButton(pdfPath: _resumePdfPath)],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 520;
        return SizedBox(
          width: 800,
          height: isCompact ? 400 : 800,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: const PdfView(
              pdfPath: _resumePdfPath,
            ),
          ),
        );
        }
      ),
    );
  }
}

class _ResumeDownloadButton extends StatelessWidget {
  final String pdfPath;

  const _ResumeDownloadButton({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Download resume',
      style: IconButton.styleFrom(
        backgroundColor: AppColors.fill(context),
        foregroundColor: AppColors.secondaryLabel(context),
        fixedSize: const Size.square(44),
        minimumSize: const Size.square(44),
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
      ),
      onPressed: () async {
        final didDownload = await downloadResume(pdfPath);

        if (!context.mounted || didDownload) {
          return;
        }

        ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          const SnackBar(content: Text('Download is available on web.')),
        );
      },
      icon: const Icon(CupertinoIcons.arrow_down_doc, size: 21),
    );
  }
}
