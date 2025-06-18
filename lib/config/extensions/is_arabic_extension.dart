extension LanguageDetection on String? {
  bool get isArabic {
    if (this == null) {
      return false;
    }
    return RegExp(r'[\u0600-\u06FF]').hasMatch(this!);
  }
}
