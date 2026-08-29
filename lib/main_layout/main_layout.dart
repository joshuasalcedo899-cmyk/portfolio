import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/centered_view/centered_view.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: CenteredView(child: child));
  }
}
