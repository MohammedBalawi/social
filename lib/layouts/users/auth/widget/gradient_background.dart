import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';

class GradientBackground extends StatelessWidget {
  final List<double>? stops;
  final Widget child;

  const GradientBackground({
    super.key,
    this.stops,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (isDarkMode) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: const DecorationImage(
            image: AssetImage('assets/images/top_hearts.png'),
            opacity: 0.05,
            alignment: AlignmentDirectional.topCenter,
          ),
        ),
        child: child,
      );
    }
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/top_hearts.png'),
          opacity: 0.05,
          alignment: AlignmentDirectional.topCenter,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            AppColors.primaryLight,
            AppColors.lightGradientColor,
          ],
          stops: stops,
        ),
      ),
      child: child,
    );
  }
}
