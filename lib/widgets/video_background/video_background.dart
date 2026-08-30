import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/video_background/overlay_button.dart';

class VideoBackground extends StatefulWidget {
  final String title;
  final String imgPath;
  final VoidCallback onTap;
  const VideoBackground(
    this.title,
    this.imgPath, {
    super.key,
    required this.onTap,
  });

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imgPath),
                fit: BoxFit.fill,
              )
            )),
          if (isHovered) ...[
            OverlayButton(widget.title, onTap: widget.onTap),
          ],
        ],
      ),
    );
  }
}
