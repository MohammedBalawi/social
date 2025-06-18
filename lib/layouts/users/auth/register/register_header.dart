import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({
    super.key,
    required this.content,
    required this.progress,
    this.title,
    this.numOfStep = 7,
  });
  final Widget content;
  final int progress;
  final String? title;
  final num numOfStep;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      color: isDarkMode ? AppColors.deepPurple : AppColors.primaryLight,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: -40,
            child: _imageBackground(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60 + MediaQuery.of(context).padding.top,
              ),
              if (title != null) _title(context),
              _progressBarWithText(context),
              const SizedBox(
                height: 26,
              ),
              Expanded(child: _content(isDarkMode)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _progressBarWithText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$progress',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextSpan(
                  text: '/$numOfStep',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.accentPink),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress / numOfStep,
              backgroundColor: AppColors.accentPink,
              color: Colors.white,
              minHeight: 8,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _content(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color:
            isDarkMode ? AppColors.deepPurpleBlack : AppColors.backgroundLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: content,
    );
  }

  Widget _title(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context)!.tr(title!),
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

Widget _imageBackground() {
  return Opacity(
    opacity: 0.05,
    child: Image.asset(
      'assets/images/top_hearts.png',
      fit: BoxFit.cover,
    ),
  );
}

Widget circleBackButton(BuildContext context) {
  return Container(
    width: 40,
    height: 40,
    margin: const EdgeInsetsDirectional.only(start: 24),
    decoration: BoxDecoration(
      color: AppColors.mainSecondaryColor,
      shape: BoxShape.circle,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 4),
          blurRadius: 4, // Blur radius
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 4),
          blurRadius: 4,
        )
      ],
    ),
    child: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      color: Colors.white,
      onPressed: Navigator.of(context).pop,
    ),
  );
}
