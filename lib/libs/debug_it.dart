import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:marrige_app/config/config.dart';

class DebugIT {
  static void printLog(String tag, dynamic message) {
    if (AppConfig.enableDebugMode) {
      debugPrint('[$tag]: ${_formatMessage(message)}');
    }
  }

  static String _formatMessage(dynamic message) {
    if (message is Map || message is List) {
      return jsonEncode(message);
    } else if (message is String) {
      return message;
    } else {
      return message.toString();
    }
  }
}
