import 'package:flutter/material.dart';

import 'elevate_button.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? style;

  const GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          colors: [
            Color(0xffA42CC8),
            Color(0xffDF298A),
          ],
        ),
      ),
      child: ElevateButton(
        text: text,
        onPressed: onPressed,
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        textStyle: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
