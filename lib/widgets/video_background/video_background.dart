import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_testing/constants/app_colors.dart';
import 'package:flutter_testing/widgets/video_background/overlay_button.dart';

class VideoBackground extends StatefulWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? accentColor;

  const VideoBackground(
    this.title,
    this.iconPath, {
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.accentColor,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    final accentColor = widget.accentColor ?? AppColors.accent;
    final backgroundColor =
        widget.backgroundColor ?? AppColors.secondaryGroupedBackground(context);

    return Semantics(
      button: true,
      label: 'Open ${widget.title}',
      child: FocusableActionDetector(
        onShowHoverHighlight: (value) {
          setState(() => isHighlighted = value);
        },
        onShowFocusHighlight: (value) {
          setState(() => isHighlighted = value);
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    border: Border.all(color: AppColors.separator(context)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        backgroundColor,
                        Color.alphaBlend(
                          accentColor.withValues(
                            alpha: isHighlighted ? 0.18 : 0.1,
                          ),
                          backgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 180),
                    scale: isHighlighted ? 1.05 : 1,
                    child: Container(
                      width: 112,
                      height: 112,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: accentColor.withValues(alpha: 0.18),
                        ),
                      ),
                      child: _StaticTileIcon(
                        iconPath: widget.iconPath,
                        color: accentColor,
                      ),
                    ),
                  ),
                ),
                OverlayButton(
                  widget.title,
                  isHighlighted: isHighlighted,
                  foregroundColor: AppColors.label(context),
                  accentColor: accentColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StaticTileIcon extends StatelessWidget {
  final String iconPath;
  final Color color;

  const _StaticTileIcon({required this.iconPath, required this.color});

  @override
  Widget build(BuildContext context) {
    if (iconPath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        iconPath,
        width: 64,
        height: 64,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      );
    }

    return Image.asset(
      iconPath,
      width: 72,
      height: 72,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.apps_rounded, size: 56, color: color);
      },
    );
  }
}
