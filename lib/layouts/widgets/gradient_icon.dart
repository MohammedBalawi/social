import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';

class GradientIcon extends StatelessWidget {

  final IconData icon;
  final double size;
  final Gradient gradient;

  const GradientIcon({
    super.key,
    required this.icon,
    this.size = 40.0,
    this.gradient = const LinearGradient(
      colors: [AppColors.accentPurple, AppColors.vibrantPink],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  });

  @override
  Widget build(BuildContext context) {

    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, size, size),
      ),
      blendMode: BlendMode.srcIn,
      child: Icon(
        icon,
        size: size,
        color: AppColors.vibrantPink,
      ),
    );
  }
}
