import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/buttons/elevate_button.dart';
import 'package:marrige_app/layouts/widgets/buttons/gradiante_button.dart';

class ThemedActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color lightBtnColor;
  final TextStyle? lightBtnTextStyle;
  const ThemedActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.lightBtnColor = AppColors.deepPurple,
    this.lightBtnTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return isDarkMode
        ? GradientButton(
            text: text,
            onPressed: onPressed,
          )
        : ElevateButton(
            color: lightBtnColor,
            onPressed: onPressed,
            textStyle:
                lightBtnTextStyle ?? Theme.of(context).textTheme.labelLarge,
            text: text,
          );
  }
}
