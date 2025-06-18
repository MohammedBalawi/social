import 'package:marrige_app/libs/debug_it.dart';

extension CountryFlag on String {
  String toFlagIcon() {
    int flagOffset = 0x1F1E6;
    int asciiOffset = 0x41;
    String flag = "\u2691";

    try {
      if (length == 2) {
        // Calculate the Unicode code points for the two characters
        int firstChar = codeUnitAt(0) - asciiOffset + flagOffset;
        int secondChar = codeUnitAt(1) - asciiOffset + flagOffset;

        // Construct the flag emoji by converting code points to characters
        flag = String.fromCharCode(firstChar) + String.fromCharCode(secondChar);
      }
    } catch (e) {
      DebugIT.printLog('CountryFlag', "Error generating flag for country: $e");
    }

    return flag;
  }
}
