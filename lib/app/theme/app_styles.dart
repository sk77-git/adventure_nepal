import 'package:flutter/material.dart';

class AppStyles{
  static TextStyle get titleStyle {
    return const TextStyle(
        fontSize: 16.5, fontWeight: FontWeight.bold, color: Colors.black, );
  }

  static TextStyle get subtitleStyle {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87);
  }

  static TextStyle get headingStyle {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  }
}