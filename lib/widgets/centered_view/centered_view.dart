import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;

  const CenteredView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 720;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 0 : 24,
            vertical: isCompact ? 0 : 32,
          ),
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
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
        );
      },
    );
  }
}
