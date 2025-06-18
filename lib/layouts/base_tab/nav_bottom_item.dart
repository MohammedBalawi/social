import 'package:flutter/material.dart';
import 'package:marrige_app/config/config.dart';
import 'package:marrige_app/layouts/widgets/gradient_icon.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class NavBottomItem extends StatelessWidget {
  final bool isSelected;
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  const NavBottomItem({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: isDarkMode ? AppColors.inputFieldDarkBackground : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected
                ? GradientIcon(
              icon: icon,
              size: 24,
            )
                : Icon(
              icon,
              size: 24,
              color: const Color(0xff938FA2),
            ),
            const SizedBox(height: 4),
            Flexible(
              child: Visibility(
                visible: !isSelected,
                child: Text(
                  AppLocalizations.of(context)!.tr(title),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xff938FA2),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
