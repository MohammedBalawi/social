import 'package:flutter/material.dart';
import 'package:marrige_app/config/config.dart';

class AppTheme {
  // Light theme
  static ThemeData light(String locale , BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: locale == 'ar' ? AppConfig.arDefaultFont : '',
      brightness: Brightness.light,
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryLight;
            }
            return Colors.black; // Unselected color
          },
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(
          color: Colors.black, //your desire colour here
          width: 1.5,
        ),
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primaryLight;
            }
            return Colors.transparent; // Unselected color
          },
        ),
      ),
      colorScheme: const ColorScheme.light(
        surface: AppColors.surfaceLight,
        primary: AppColors.primaryLight,
        onSurface: Colors.white,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.primaryLight,
        thickness: 2,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.black, // Suffix icon color for light theme
      ),
      textTheme: TextTheme(
        headlineMedium: AppTextStyles.getTextStyle(locale, 'headlineMedium',context: context),
        headlineSmall: AppTextStyles.getTextStyle(
          locale,
          'headlineSmall',
          color: AppColors.primaryLight,context: context
        ),
        labelMedium: AppTextStyles.getTextStyle(
          locale,
          'labelMedium',context: context
        ),
        labelLarge: AppTextStyles.getTextStyle(
          locale,
          'labelLarge',context: context
        ),
        titleSmall: AppTextStyles.getTextStyle(
          locale,
          'titleSmall',
          color: AppColors.deepPurple,context: context
        ),
        bodySmall: AppTextStyles.getTextStyle(
          locale,
          'bodySmall',
          color: AppColors.primaryLight,context: context
        ),
        labelSmall: AppTextStyles.getTextStyle(
          locale,
          'labelSmall',
          color: AppColors.invalidRedColor,context: context
        ),
        displaySmall: AppTextStyles.getTextStyle(
          locale,
          'displaySmall',
          color: AppColors.darkGray,context: context
        ),
        titleLarge: AppTextStyles.getTextStyle(
          locale,
          'titleLarge',context: context
        ),
        titleMedium: AppTextStyles.getTextStyle(
          locale,
          'titleMedium',context: context
        ),
      ),
    );
  }

  // Dark theme
  static ThemeData dark(String locale , BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: locale == 'ar' ? AppConfig.arDefaultFont : '',
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.mediumLavender;
            }
            return Colors.white; // Unselected color
          },
        ),
      ),
      colorScheme: ColorScheme.dark(
        surface: Colors.grey.shade900,
        primary: AppColors.primaryDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          // foregroundColor: Colors.white,
          // textStyle: AppTextStyles.getTextStyle(
          //   locale,
          //   'labelLarge',
          // ),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Colors.white,
        thickness: 2,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // Color for icons in light theme
      ),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.white, // Suffix icon color for light theme
      ),
      checkboxTheme: CheckboxThemeData(
        side: const BorderSide(
          color: Colors.white, //your desire colour here
          width: 1.5,
        ),
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.mediumLavender;
            }
            return Colors.transparent; // Unselected color
          },
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: AppTextStyles.getTextStyle(locale, 'headlineMedium',context: context),
        bodyMedium: AppTextStyles.getTextStyle(locale, 'bodyMedium',context: context),
        headlineSmall: AppTextStyles.getTextStyle(
          locale,
          'headlineSmall',
          color: Colors.white,context: context
        ),
        labelMedium: AppTextStyles.getTextStyle(
          locale,
          'labelMedium',context: context
        ),
        labelLarge: AppTextStyles.getTextStyle(
          locale,
          'labelLarge',context: context
        ),
        titleSmall: AppTextStyles.getTextStyle(
          locale,
          'titleSmall',
          color: Colors.white,context: context
        ),
        bodySmall: AppTextStyles.getTextStyle(
          locale,
          'bodySmall',
          color: Colors.white,context: context
        ),
        labelSmall: AppTextStyles.getTextStyle(
          locale,
          'labelSmall',
          color: AppColors.invalidRedColor,context: context
        ),
        displaySmall: AppTextStyles.getTextStyle(
          locale,
          'displaySmall',
          color: AppColors.darkGray,context: context
        ),
        titleLarge: AppTextStyles.getTextStyle(
          locale,
          'titleLarge',context: context
        ),
        titleMedium: AppTextStyles.getTextStyle(
          locale,
          'titleMedium',context: context
        ),
      ),
    );
  }
}
