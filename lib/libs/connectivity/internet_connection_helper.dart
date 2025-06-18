import 'package:flutter/material.dart';
import 'package:marrige_app/layouts/widgets/popup/popup.dart';

import 'package:marrige_app/libs/connectivity/connectivity_checker_impl.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';

class InternetConnectionHelper {
  final _connectivityChecker = ConnectivityCheckerImpl();
  final String _tag = "InternetConnectionHelper";

  Future<void> checkConnectionAndShowError(BuildContext context) async {
    bool hasConnection = await _connectivityChecker.hasConnection();
    if (!hasConnection) {
      if (context.mounted) {
        DebugIT.printLog(_tag, 'No internet connection, showing error popup');
        _showErrorPopup(context);
      }
    }
  }

  void _showErrorPopup(BuildContext context) {
    PopupHelper.showErrorPopup(
      context,
      PopupModel(
        title: 'Tilte',
        message: 'No internet connection',
        button1Text: AppLocalizations.of(context)!.tr('ok'),
        button1Action: () {
          Navigator.pop(context);
          checkConnectionAndShowError(context);
        },
      ),
    );
  }
}
