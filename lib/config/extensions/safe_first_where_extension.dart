extension SafeFirstWhere<T> on List<T>? {
  /// Returns the first matching element or `null` if not found
  T? firstOrNull(bool Function(T) test) {
    try {
      return this?.firstWhere(test);
    } catch (e) {
      return null; // Return null if not found
    }
  }
}
