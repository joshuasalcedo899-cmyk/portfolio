import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const accent = CupertinoColors.activeBlue;
  static const destructive = CupertinoColors.destructiveRed;

  static Color background(BuildContext context) {
    return CupertinoDynamicColor.resolve(
      CupertinoColors.systemBackground,
      context,
    );
  }

  static Color groupedBackground(BuildContext context) {
    return CupertinoDynamicColor.resolve(
      CupertinoColors.systemGroupedBackground,
      context,
    );
  }

  static Color secondaryGroupedBackground(BuildContext context) {
    return CupertinoDynamicColor.resolve(
      CupertinoColors.secondarySystemGroupedBackground,
      context,
    );
  }

  static Color tertiaryGroupedBackground(BuildContext context) {
    return CupertinoDynamicColor.resolve(
      CupertinoColors.tertiarySystemGroupedBackground,
      context,
    );
  }

  static Color label(BuildContext context) {
    return CupertinoDynamicColor.resolve(CupertinoColors.label, context);
  }

  static Color secondaryLabel(BuildContext context) {
    return CupertinoDynamicColor.resolve(
      CupertinoColors.secondaryLabel,
      context,
    );
  }

  static Color separator(BuildContext context) {
    return CupertinoDynamicColor.resolve(CupertinoColors.separator, context);
  }

  static Color fill(BuildContext context) {
    return CupertinoDynamicColor.resolve(CupertinoColors.systemFill, context);
  }
}

Color getTextColor(Color backgroundColor) {
  return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
}

Color buttonColor = const Color.fromARGB(83, 156, 153, 153);
