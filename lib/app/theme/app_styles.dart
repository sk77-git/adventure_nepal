import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle get titleStyle {
    return const TextStyle(
      fontSize: 16.5,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle get subtitleStyle {
    return const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87);
  }

  static TextStyle get headingStyle {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  }

  //subheading style- card number
  static TextStyle get subHeadingStyle {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textColor);
  }

  //input label, news title, button text
  static TextStyle get labelStyle {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textColor);
  }

  //hint and messages
  static TextStyle get hintStyle {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.hintColor);
  }

  //typed text
  static TextStyle get textStyle {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textColor);
  }

  static InputDecoration inputDecoration2(
    Widget? suffixIcon,
    String? hint, {
    Color? fillColor,
    Widget? prefixIcon,
  }) {
    return InputDecoration(
      suffixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      fillColor: fillColor ?? AppColors.white,
      filled: true,
      hintText: hint,
      hintStyle: AppStyles.hintStyle,
      errorStyle: AppStyles.hintStyle.copyWith(color: AppColors.red),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.dividerColor),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.dividerColor),
      ),
      border: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.dividerColor),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.red),
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: AppColors.red),
      ),
    );
  }
}
