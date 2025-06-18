import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextDirectionState {
  final TextAlign textAlign;
  final TextDirection textDirection;

  TextDirectionState(this.textAlign, this.textDirection);
}

class TextDirectionValidationBloc extends Cubit<TextDirectionState> {
  final String _tag = "TextDirectionValidationBloc";

  TextDirectionValidationBloc(BuildContext context)
      : super(_getInitialDirection(context)) {
    debugPrint("$_tag Initialized with direction based on locale");
  }

  static TextDirectionState _getInitialDirection(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    bool isRTL = _isRTL(currentLocale.languageCode);

    debugPrint(
        "TextDirectionValidationBloc - Locale: ${currentLocale.languageCode}, RTL: $isRTL");

    return TextDirectionState(
      TextAlign.start,
      isRTL ? TextDirection.rtl : TextDirection.ltr,
    );
  }

  void updateTextDirection(String text) {
    debugPrint("$_tag - updateTextDirection called with text: $text");

    if (text.isEmpty) {
      debugPrint("$_tag - Empty text, resetting to initial direction");
      emit(state); // Keep the initial locale-based direction
      return;
    }

    String firstChar = text.trim().characters.first;

    if (_isArabic(firstChar)) {
      debugPrint(
          "$_tag - Arabic character detected, setting text direction to RTL");
      emit(TextDirectionState(TextAlign.start, TextDirection.rtl));
    } else {
      debugPrint(
          "$_tag - Non-Arabic character detected, setting text direction to LTR");
      emit(TextDirectionState(TextAlign.start, TextDirection.ltr));
    }
  }

  static bool _isRTL(String languageCode) {
    // List of known RTL languages
    const rtlLanguages = ['ar', 'he', 'fa', 'ur'];
    return rtlLanguages.contains(languageCode);
  }

  bool _isArabic(String char) {
    return char.codeUnitAt(0) >= 0x0600 && char.codeUnitAt(0) <= 0x06FF;
  }
}
