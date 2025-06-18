import 'package:flutter/material.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';

class TranslatedText extends StatelessWidget {
  final String translationKey;

  const TranslatedText(this.translationKey, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Text(
      AppLocalizations.of(context)!.tr(translationKey),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        fontWeight: FontWeight.w900,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
    );
  }
}
