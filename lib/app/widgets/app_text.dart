import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
      {Key? key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.style,
      this.maxLines})
      : super(key: key);
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style ??
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
