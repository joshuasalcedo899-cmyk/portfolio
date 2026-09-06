import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testing/constants/app_colors.dart';

class AppleDialogScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final double maxWidth;
  final Color? backgroundColor;
  final List<Widget> actions;

  const AppleDialogScaffold({
    super.key,
    required this.title,
    required this.child,
    this.maxWidth = 640,
    this.backgroundColor,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final surfaceColor = backgroundColor ?? AppColors.background(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: size.height - 48,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: DecoratedBox(
            decoration: BoxDecoration(color: surfaceColor),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(color: AppColors.label(context)),
                        ),
                      ),
                      for (final action in actions)
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: action,
                        ),
                      IconButton(
                        tooltip: 'Close',
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.fill(context),
                          foregroundColor: AppColors.secondaryLabel(context),
                          fixedSize: const Size.square(44),
                          minimumSize: const Size.square(44),
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(CupertinoIcons.xmark, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Flexible(child: child),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
