import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';

class LaterButton extends StatelessWidget {
  const LaterButton({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 18.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppLocalizations.of(context)!.tr('later'),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.slateGray,
              ),
        ),
      ),
    );
  }
}
