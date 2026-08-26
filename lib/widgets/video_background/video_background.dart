import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/contact/contact.dart';
import 'package:flutter_testing/widgets/video_background/gif_renderer.dart';
import 'package:flutter_testing/widgets/video_background/overlay_button.dart';

class VideoBackground extends StatefulWidget {
  final String path;
  final String title;
  final VoidCallback onTap;
  const VideoBackground(
    this.path,
    this.title, {
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
          GifRenderer(widget.path),

          if (isHovered) ...[
            GifRenderer(widget.path),
            OverlayButton(widget.title, onTap: widget.onTap),
        ]else Container (
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/ARIA.png'),
              fit: BoxFit.cover,)
            )
        ),
          if (isHovered && widget.title == 'Contacts') Contact(widget.title),
        ],
      ),
    );
  }
}
