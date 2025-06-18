import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/popup/popup.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class PopupHelper {
  static bool thereIsAnOpenAlertNow = false;
  static bool _isLoadingDialogVisible = false;

  static const String _tag = "PopupHelper";

  static Future<void> showNormalPopup(
    BuildContext context,
    PopupModel model,
  ) async {
    if (thereIsAnOpenAlertNow) {
      return;
    }

    thereIsAnOpenAlertNow = true;
    DebugIT.printLog('$_tag showNormalPopup',
        'Set the flag thereIsAnOpenAlertNow to $thereIsAnOpenAlertNow to indicate a bottom sheet is open');
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    await showModalBottomSheet(
      context: context,
      barrierColor: isDarkMode ? Colors.grey.withOpacity(0.3) : null,
      backgroundColor: Theme.of(context).colorScheme.primary,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) => NormalPopup(
        popupModel: model,
      ),
    );
    DebugIT.printLog('$_tag showNormalPopup',
        'Set the flag thereIsAnOpenAlertNow to $thereIsAnOpenAlertNow to indicate a bottom sheet is closed');

    thereIsAnOpenAlertNow = false;
  }



  static Future<void> showErrorPopup(
    BuildContext context,
    PopupModel model,
  ) async {
    if (thereIsAnOpenAlertNow) {
      return;
    }

    thereIsAnOpenAlertNow = true;
    DebugIT.printLog('$_tag showErrorPopup',
        'Set the flag thereIsAnOpenAlertNow to $thereIsAnOpenAlertNow to indicate a dialog is open');
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    DebugIT.printLog('$_tag showErrorPopup', 'show error dialog');

    await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: !isDarkMode
            ? AppColors.errorDialogLightBackground
            : AppColors.errorDialogDarkBackground,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: ErrorPopup(popupModel: model),
      ),
    );
    DebugIT.printLog('$_tag showErrorPopup',
        'Set the flag thereIsAnOpenAlertNow to $thereIsAnOpenAlertNow to indicate a dialog is closed');

    thereIsAnOpenAlertNow = false;
  }

  static Future<void> showSimpleErrorPopup(
    BuildContext context,
    PopupModel model, {
    bool barrierDismissible = true,
  }) async {
    if (thereIsAnOpenAlertNow) {
      return;
    }

    thereIsAnOpenAlertNow = true;
    DebugIT.printLog('$_tag showSimpleErrorPopup',
        'Set the flag thereIsAnOpenAlertNow to $thereIsAnOpenAlertNow to indicate a dialog is open');
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    await showDialog(
      context: context,
      barrierColor: isDarkMode ? Colors.grey.withOpacity(0.3) : null,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog(
        backgroundColor: !isDarkMode
            ? AppColors.simpleErrorDialogContainerLightBackground
            : AppColors.primaryDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: SimpleErrorPopup(popupModel: model),
      ),
    );
    DebugIT.printLog('$_tag showErrorPopup',
        'Set the flag thereIsAnOpenAlertNow to $thereIsAnOpenAlertNow to indicate a dialog is closed');

    thereIsAnOpenAlertNow = false;
  }

  static Future<void> showIncompletePopup(
      BuildContext context, String message) async {
    await showNormalPopup(
      context,
      PopupModel(
        title: AppLocalizations.of(context)!.tr('registration_info_incomplete'),
        message: message,
        imageAsset: 'assets/images/incomplete_popup_image.png',
        button1Text:
            AppLocalizations.of(context)!.tr('complete_registration_details'),
        button1Action: () {
          //toDo:navigate to register screen
        },
        button2Text: AppLocalizations.of(context)!.tr('later'),
        button2Action: () => Navigator.pop(context),
      ),
    );
  }

  static Future<void> showReactivatePopup(
    BuildContext context,
    String message, {
    VoidCallback? reactivateCallBack,
    VoidCallback? logoutCallBack,
  }) async {
    await showNormalPopup(
      context,
      PopupModel(
        title: '',
        message: message,
        showCloseIcon: false,
        imageAsset: 'assets/images/reactivate_image.png',
        button1Text: AppLocalizations.of(context)!.tr('Re-activate account'),
        button1Action: reactivateCallBack,
        button2Text: AppLocalizations.of(context)!.tr('Logout'),
        button2Action: logoutCallBack,
      ),
    );
  }



  static OverlayEntry? _loadingOverlay;

static Future<void> showLoadingDialog(BuildContext? context,
    {bool BlockWindow = false, Duration timeout = const Duration(seconds: 20)}) async {
  if (_isLoadingDialogVisible || context == null) return;
  _isLoadingDialogVisible = true;

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final overlayState = Navigator.of(context, rootNavigator: true).overlay;
    if (overlayState == null) return;
    _loadingOverlay = OverlayEntry(builder: (context) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Stack(
        children: [
          if (BlockWindow) ModalBarrier(dismissible: false, color: Colors.black54),
          Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                isDark ? Colors.white.withOpacity(0.5) : AppColors.primaryLight,
              ),
            ),
          ),
        ],
      );
    });

    overlayState.insert(_loadingOverlay!);

    Future.delayed(timeout, () => hideLoadingDialog());
  });
}

static void hideLoadingDialog() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (_isLoadingDialogVisible && _loadingOverlay != null) {
      _loadingOverlay!.remove();
      _loadingOverlay = null;
      _isLoadingDialogVisible = false;
    }
  });
}




  static void showActivePopup(BuildContext context, String message) async {
    await showNormalPopup(
      context,
      PopupModel(
        title: AppLocalizations.of(context)!
            .tr('account_reactivated_successfully'),
        message: message,
        imageAsset: '', //image here is premium
        button1Text: AppLocalizations.of(context)!.tr('ok'),
        button1Action: () => Navigator.pop(context),
      ),
    );
  }

  static Future<void> showRestrictedPopup(
    BuildContext context,
    String message, {
    required VoidCallback onContactAdmin,
    required VoidCallback onLogout,
  }) async {
    await showNormalPopup(
      context,
      PopupModel(
        title: '',
        message: message,
        showCloseIcon: false,
        button1Text: AppLocalizations.of(context)!.tr('connect_admins'),
        button1Action: onContactAdmin,
        button2Text: AppLocalizations.of(context)!.tr('logout'),
        button2Action: onLogout,
      ),
    );
  }

  static Future<void> showUpgradePopup(
    BuildContext context,
    String message, {
    required VoidCallback onUpgrade,
    required VoidCallback onLogout,
  }) async {
    await showNormalPopup(
      context,
      PopupModel(
        title:
            AppLocalizations.of(context)!.tr('account_temporarily_suspended'),
        message: message,
        button1Text: AppLocalizations.of(context)!.tr('upgrade_remove_ban'),
        button1Action: onUpgrade,
        button2Text: AppLocalizations.of(context)!.tr('logout'),
        button2Action: onLogout,
      ),
    );
  }

  static Future<void> showNoticePopup(
    BuildContext context,
    String message, {
    required VoidCallback onOkPressed,
  }) async {
    await showNormalPopup(
      context,
      PopupModel(
        title: AppLocalizations.of(context)!.tr('note'),
        message: message,
        showCloseIcon: false,
        imageAsset: 'assets/images/note.png',
        button1Text: AppLocalizations.of(context)!.tr('oK'),
        button1Action: onOkPressed,
      ),
    );
  }

  static Future<void> showDefaultPopup(
    BuildContext context,
    String message, {
    required VoidCallback onRetry,
    required VoidCallback onCancel,
  }) async {
    await showNormalPopup(
      context,
      PopupModel(
        title: AppLocalizations.of(context)!.tr('connect_error'),
        message: message,
        button1Text: AppLocalizations.of(context)!.tr('try_again'),
        button1Action: onRetry,
        button2Text: AppLocalizations.of(context)!.tr('cancel'),
        button2Action: onCancel,
      ),
    );
  }

  static void showMessage(
    BuildContext context,
    String message, {
    bool isError = true,
  }) {
    final snackBar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextButton(
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            child: Text(AppLocalizations.of(context)!.tr('ok'), style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
