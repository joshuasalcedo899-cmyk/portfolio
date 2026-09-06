import 'package:flutter/material.dart';

class OverlayButton extends StatelessWidget {
  final String title;
  final bool isHighlighted;
  final Color foregroundColor;
  final Color accentColor;

  const OverlayButton(
    this.title, {
    super.key,
    this.isHighlighted = false,
    this.foregroundColor = Colors.white,
    this.accentColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isCompact = constraints.maxWidth < 720;

          // On mobile: always show the text.
          // On desktop: only show when highlighted.
          final shouldShow = isCompact || isHighlighted;

          return Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 180),
              opacity: shouldShow ? 1 : 0,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 180),
                scale: isHighlighted ? 1.02 : 1,
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.headlineMedium?.copyWith(
                        color: foregroundColor,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}