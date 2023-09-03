import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  const TextUtils({
    super.key,
    required this.titleText,
    required this.style,
    required this.textAlign,
    this.overflow,
  });


  final String titleText;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return  Text(
      titleText,
      textAlign: textAlign,
      style: style,
      overflow:overflow,

    );
  }
}
