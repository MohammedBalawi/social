import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';

class TextFieldTitle extends StatelessWidget {
  final String text;
  final double paddingStart;
  final Color lightColor;
  const TextFieldTitle({
    super.key,
    required this.text,
    this.paddingStart = 32.0,
    this.lightColor = AppColors.primaryLight,
  });
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsetsDirectional.only(start: paddingStart),
      child: Text(
        AppLocalizations.of(context)!.tr(text),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: isDarkMode ? Colors.white : lightColor,
            ),
      ),
    );
  }
}
