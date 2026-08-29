import 'package:flutter/material.dart';


Color getTextColor(Color backgroundColor) {
  return backgroundColor.computeLuminance() > 0.5
      ? Colors.black
      : Colors.white;
}

Color buttonColor = Color.fromARGB(83, 156, 153, 153);