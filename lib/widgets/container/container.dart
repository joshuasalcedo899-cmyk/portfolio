import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/video_background/video_background.dart';

class ContainerBox extends StatefulWidget {
  final String name;
  final String imagePath;
  final VoidCallback onTap;
  const ContainerBox(this.name, this.imagePath, {super.key, required this.onTap});

  @override
  State<ContainerBox> createState() => _ContainerBoxState();
}

class _ContainerBoxState extends State<ContainerBox> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
      return VideoBackground(widget.name, widget.imagePath, onTap: widget.onTap);
  }
}
