T? validateType<T>(dynamic value,
    {T Function(Map<String, dynamic>)? fromJson}) {
  // If the value is null, return null
  if (value == null) {
    return null;
  }

  if (value is List<dynamic> && T == List<String>) {
    return value.isEmpty ? null : value.cast<String>() as T;
  }
  // If the value is an empty string and T is String, return null
  if (value is String && value.isEmpty && T == String) {
    return null;
  }

  // If the value is a Map and we have a fromJson function, deserialize it
  if (value is Map<String, dynamic> && fromJson != null) {
    return fromJson(value);
  }

  // If the type matches T, return the value as is
  if (value is T) {
    return value;
  }

  // If no condition matches, return null
  return null;
}
