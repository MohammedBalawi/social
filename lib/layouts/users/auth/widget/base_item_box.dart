import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/users/auth/widget/text_field_container.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class BaseItemBox extends StatelessWidget {
  const BaseItemBox({
    super.key,
    required this.name,
  });
  final String? name;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Stack(
        children: [
          Container(
            height: 56,
            alignment: AlignmentDirectional.centerStart,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? AppColors.inputFieldDarkBackground
                  : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(0.04),
                  offset: const Offset(0, 2),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Text(
                name ?? AppLocalizations.of(context)!.tr('select'),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isDarkMode
                          ? Colors.white
                          : AppColors.secondaryTextGray,
                    ),
              ),
            ),
          ),
          const TextFieldContainer(),
        ],
      ),
    );
  }
}
