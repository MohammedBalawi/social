import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class AnimatedValidationText extends StatelessWidget {
  final bool showValidation;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final bool shouldReplaced;
  final Color background;
  final Color? textColor;
  final bool showPrefix;

  const AnimatedValidationText({
    required this.showValidation,
    required this.text,
    super.key,
    this.padding,
    this.shouldReplaced = true,
    this.background = Colors.white,
    this.showPrefix = true,
    this.textColor,
  });

  String _message(BuildContext context) {
    if (!shouldReplaced) {
      return AppLocalizations.of(context)!.tr(text ?? '');
    }
    return AppLocalizations.of(context)!
        .tr('select_field_first')
        .replaceFirst('#field', '$text');
  }

  @override
  Widget build(BuildContext context) {
    final isInvalid = showValidation && (text ?? '').trim().isNotEmpty;

    return AnimatedSize(
      duration: const Duration(
        milliseconds: 300,
      ),
      child: AnimatedOpacity(
        duration: const Duration(
          milliseconds: 300,
        ),
        opacity: isInvalid ? 1 : 0,
        child: Container(
          color: background,
          height: isInvalid ? null : 0,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (showPrefix) SvgPicture.asset('assets/icons/invalid_icon.svg'),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  _message(context),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: textColor,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
