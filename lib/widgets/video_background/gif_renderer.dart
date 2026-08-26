import 'package:flutter/material.dart';
import 'package:gif/gif.dart';


class GifRenderer extends StatefulWidget {
  final String path;
  const GifRenderer(this.path, {super.key});

  @override
  State<GifRenderer> createState() => _AnimatedGifWidgetState();
}

class _AnimatedGifWidgetState extends State<GifRenderer> with TickerProviderStateMixin {
  late final GifController _controller = GifController(vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      image: AssetImage(widget.path),
      controller: _controller,
      autostart: Autostart.loop,
      fit: BoxFit.cover,
    );
  }
}