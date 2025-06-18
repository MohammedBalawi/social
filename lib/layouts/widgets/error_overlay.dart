import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';

class ErrorOverlay extends StatelessWidget {
  const ErrorOverlay({
    super.key,
    required this.isVisible,
    required this.content,
  });
  final bool isVisible;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        Positioned.fill(
          child: AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: const Duration(milliseconds: 1000),
            child: IgnorePointer(
              child: Container(
                margin: const EdgeInsetsDirectional.only(start: 12, end: 18),
                decoration: BoxDecoration(
                    color: AppColors.cherryRed.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
