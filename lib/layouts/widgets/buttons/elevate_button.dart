import 'package:flutter/material.dart';

class ElevateButton extends StatelessWidget {
  const ElevateButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.shadowColor,
  });
  final String text;
  final Color? color;
  final Color? shadowColor;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shadowColor: shadowColor,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
