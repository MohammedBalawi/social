import 'package:flutter/material.dart';
import 'package:marrige_app/layouts/widgets/popup/popup.dart';
import 'package:marrige_app/libs/lang/lang.dart';
import 'package:permission_handler/permission_handler.dart';

import 'debug_it.dart';

class PermissionHandlerMicrophoneImp {
  final String _tag = "PermissionHandlerMicrophoneImp";

  Future<bool> checkMicrophonePermission(BuildContext context) async {
    // Check the current status of the microphone permission
    DebugIT.printLog(_tag, "Checking microphone permission...");

    final status = await Permission.microphone.status;

    if (status.isGranted) {
      DebugIT.printLog(_tag, "Microphone permission already granted.");

      return true; // Permission already granted
    }
    if (!context.mounted) {
      return false;
    }
    if (status.isDenied || status.isRestricted) {
      DebugIT.printLog(_tag, "Microphone permission is denied or restricted.");

      return await _requestPermission(context);
    }
    if (status.isPermanentlyDenied) {
      // If permission is permanently denied, show settings dialog
      DebugIT.printLog(_tag, "Microphone permission is permanently denied.");

      _showPermissionSettingsDialog(context);
      return false;
    }
    return false;
  }

  Future<bool> _requestPermission(BuildContext context) async {
    DebugIT.printLog(_tag, "Requesting microphone permission...");

    final status = await Permission.microphone.request();

    if (status.isGranted) {
      DebugIT.printLog(_tag, "Microphone permission granted after request.");

      return true; // Permission granted
    }
    if (!context.mounted) {
      return false;
    }
    if (status.isPermanentlyDenied) {
      DebugIT.printLog(
          _tag, "Permission permanently denied. Showing settings dialog.");
      _showPermissionSettingsDialog(context);
      return false;
    }
    return false;
  }

  void _showPermissionSettingsDialog(BuildContext context) {
    PopupHelper.showNormalPopup(
      context,
      PopupModel(
        message:
            AppLocalizations.of(context)!.tr('microphone_permission_required'),
        button1Text: AppLocalizations.of(context)!.tr('open_settings'),
        button1Action: () async {
          final opened = await openAppSettings();
          if (!opened) {
            // Handle failure to open settings if needed
            debugPrint('Failed to open app settings');
          }
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
        button2Action: () => Navigator.pop(context),
        button2Text: AppLocalizations.of(context)!.tr('cancel'),
      ),
    );
  }
}
