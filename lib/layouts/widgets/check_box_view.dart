import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';

class CheckBoxView extends StatelessWidget {
  final bool isChecked;
  final Color checkedColor;
  final Color unCheckedColor;
  final Color? checkBoxColor;
  final VoidCallback? onTapped;
  final Widget child;
  final double? checkBoxSize;
  final double? checkBoxBorderWidth;
  final double? checkBoxBorderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const CheckBoxView({
    required this.child,
    this.isChecked = false,
    this.checkedColor = Colors.transparent,
    this.unCheckedColor = AppColors.black20Opacity,
    this.checkBoxSize,
    this.checkBoxBorderWidth,
    this.onTapped,
    this.padding,
    this.margin,
    super.key,
    this.checkBoxBorderRadius,
    this.checkBoxColor,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 6),
        padding: const EdgeInsets.all(10),
        color: Colors.transparent,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                gradient: isChecked
                    ? const LinearGradient(
                        colors: [
                          AppColors.accentPurple,
                          AppColors.vibrantPink,
                        ],
                      )
                    : null,
                borderRadius: BorderRadius.circular(checkBoxBorderRadius ?? 6),
                border: Border.all(
                  color: isChecked ? checkedColor : unCheckedColor,
                  width: checkBoxBorderWidth ?? 3,
                ),
              ),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isChecked ? 1 : 0,
                child: const Center(
                    child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 20,
                )),
              ),
            ),
            Flexible(
              flex: 1,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
