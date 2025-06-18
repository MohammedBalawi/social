import 'package:flutter/services.dart';

class CNumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex = newValue.selection.end;
    var input = fixHindiNumerics(newValue.text);
    final StringBuffer newText = StringBuffer();
    newText.write(input);
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  static const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  static const farsi = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  static String fixHindiNumerics(String input) {
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(farsi[i], english[i]);
    }
    return input;
  }
}