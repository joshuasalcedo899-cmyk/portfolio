import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/widgets/modals/apple_dialog_scaffold.dart';

class AboutMeView extends StatelessWidget {
  const AboutMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppleDialogScaffold(
      title: 'ABOUT ME',
      maxWidth: 760,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 560;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: isCompact
                  ? const _CompactProfile()
                  : const _WideProfile(),
            ),
          );
        },
      ),
    );
  }
}

class _WideProfile extends StatelessWidget {
  const _WideProfile();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 190,
          child: _ProfileIdentity(),
        ),
        const SizedBox(width: 24),
        Expanded(child: _ProfileDetails()),
      ],
    );
  }
}

class _CompactProfile extends StatelessWidget {
  const _CompactProfile();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ProfileIdentity(horizontal: true),
        const SizedBox(height: 24),
        _ProfileDetails(),
      ],
    );
  }
}

class _ProfileIdentity extends StatelessWidget {
  final bool horizontal;

  const _ProfileIdentity({this.horizontal = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final portrait = ClipRRect(
      borderRadius: BorderRadius.circular(horizontal ? 56 : 16),
      child: Image.asset(
        'assets/Me.png',
        width: horizontal ? 112 : double.infinity,
        height: horizontal ? 112 : 190,
        fit: BoxFit.cover,
        alignment: const Alignment(0, -0.1),
      ),
    );

    final details = Column(
      crossAxisAlignment: horizontal
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          'Joshua Salcedo',
          textAlign: horizontal ? TextAlign.left : TextAlign.center,
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.label(context),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'FULL STACK DEVELOPER',
          textAlign: horizontal ? TextAlign.left : TextAlign.center,
          style: textTheme.labelMedium?.copyWith(
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Web · Mobile · Creative tools',
          textAlign: horizontal ? TextAlign.left : TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.secondaryLabel(context),
          ),
        ),
      ],
    );

    if (horizontal) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          portrait,
          const SizedBox(width: 16),
          Expanded(child: details),
        ],
      );
    }

    return Column(
      children: [portrait, const SizedBox(height: 16), details],
    );
  }
}

class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'I build useful things for the web and mobile.',
          style: textTheme.headlineSmall?.copyWith(
            color: AppColors.label(context),
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'I am a developer who enjoys turning ideas into clear, thoughtful experiences. I care about the small details that make software feel natural to use, from the first interaction to the last pixel.',
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.secondaryLabel(context),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'WHAT I FOCUS ON',
          style: textTheme.labelMedium?.copyWith(
            color: AppColors.secondaryLabel(context),
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _FocusTile(
              icon: CupertinoIcons.device_laptop,
              label: 'Web experiences',
            ),
            _FocusTile(
              icon: CupertinoIcons.device_phone_portrait,
              label: 'Mobile apps',
            ),
            _FocusTile(
              icon: CupertinoIcons.lightbulb,
              label: 'Product thinking',
            ),
          ],
        ),
        const SizedBox(height: 22),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.fill(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.separator(context)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.briefcase,
                  color: AppColors.accent,
                  size: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Currently building\n',
                          style: textTheme.labelLarge?.copyWith(
                            color: AppColors.label(context),
                          ),
                        ),
                        TextSpan(
                          text: 'accessible, purposeful software with a little personality.',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.secondaryLabel(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FocusTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FocusTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.secondaryGroupedBackground(context),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.separator(context)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: AppColors.accent),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.label(context),
            ),
          ),
        ],
      ),
    );
  }
}
