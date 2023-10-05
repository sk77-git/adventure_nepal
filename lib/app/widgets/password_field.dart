import 'package:flutter/material.dart';

import '../theme/app_styles.dart';

class PasswordField extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hint;
  final Color? fillColor;
  final bool? obscureText;
  final bool? autoFocus;
  final TextInputType? textInputType;
  final Function(String)? onChangedCallback;
  final String? Function(String?)? validator; // Updated validator type

  const PasswordField({
    Key? key,
    this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.hint,
    this.fillColor,
    this.obscureText,
    this.autoFocus,
    this.textInputType,
    this.onChangedCallback,
    this.initialValue,
    this.validator, // Updated constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? "",
            style: AppStyles.labelStyle,
          ),
        TextFormField(
          autofocus: autoFocus ?? false,
          obscureText: obscureText ?? false,
          style: AppStyles.textStyle,
          initialValue: initialValue,
          keyboardType: textInputType,
          decoration: AppStyles.inputDecoration2(suffixIcon, hint,
              fillColor: fillColor, prefixIcon: prefixIcon),
          validator: validator,
          // Updated validator assignment
          onChanged: (newValue) {
            onChangedCallback?.call(newValue);
          },
        )
      ],
    );
  }
}
