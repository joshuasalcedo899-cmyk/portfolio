import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final double width;
  final double bottomPadding;
  final Widget child;
  const CenteredView({super.key, required this.width ,required this.bottomPadding, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 720;

        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              isCompact ? 0 : 24,
              isCompact ? 0 : 32,
              isCompact ? 0 : 24,
              isCompact ? 0 : bottomPadding,
            ),
            alignment: Alignment.topCenter,
            child: Container(
              constraints: BoxConstraints(maxWidth: width),
              decoration: BoxDecoration(
                boxShadow: isCompact
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
