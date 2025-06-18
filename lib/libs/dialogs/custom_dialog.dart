import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/layouts/widgets/popup/popup_helper.dart';
import 'package:marrige_app/libs/lang/localization_helper.dart';
import 'package:marrige_app/main.dart';

class CustomDialog {
  static CustomDialog? _instance;
  late AwesomeDialog _dialog;
  BuildContext? _context;
  late bool _isDarkMode;

  CustomDialog._();

  factory CustomDialog() {
    _instance ??= CustomDialog._();
    return _instance!;
  }

  void initialize({VoidCallback? onReady}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _context = navigatorKey.currentContext;
      if (_context != null) {
        _isDarkMode = Theme.of(_context!).brightness == Brightness.dark;
        if (onReady != null) onReady(); // استدعاء `show()` تلقائيًا عند الجاهزية
      }
    });
  }

  void show({
    required DialogType type,
    String? title,
    String? desc,
    String? descVariable,
    String? btn1Text,
    String? btn2Text,
    String? btn3Text,
    VoidCallback? btn1OnPress,
    VoidCallback? btn2OnPress,
    VoidCallback? btn3OnPress,
    Color? btn1Color,
    Color? btn2Color,
  }) {
      if(PopupHelper.thereIsAnOpenAlertNow){
        return;
      }
      if (_context == null) {
        initialize(onReady: () => show(
          type: type,
          title: title,
          desc: desc,
          descVariable: descVariable,
          btn1Text: btn1Text,
          btn2Text: btn2Text,
          btn3Text: btn3Text,
          btn1OnPress: btn1OnPress,
          btn2OnPress: btn2OnPress,
          btn3OnPress: btn3OnPress,
          btn1Color: btn1Color,
          btn2Color: btn2Color,
        ));
        return;
      }
      if(!_context!.mounted){
        return;
      }
      PopupHelper.thereIsAnOpenAlertNow = true;

    _dialog = AwesomeDialog(
      context: _context!,
      width:  MediaQuery.of(_context!).size.width > 500 ? 500 : MediaQuery.of(_context!).size.width,
      dialogType: type,
      title: _translate(title),
      desc: _translate(desc,descVariable),
      btnOkText: _translate(btn1Text),
      btnCancelText: btn2Text==null ? null: _translate(btn2Text),
      btnOkOnPress: () {
        PopupHelper.thereIsAnOpenAlertNow = false; // الكود المشترك
        btn1OnPress?.call(); // استدعاء الدالة إذا لم تكن null
      },
      btnCancelOnPress: btn2Text==null ? null: () {
        PopupHelper.thereIsAnOpenAlertNow = false; // الكود المشترك
        btn2OnPress?.call(); // استدعاء الدالة إذا لم تكن null
      },
      btnOkColor: btn1Color ??  (_isDarkMode?AppColors.Button1BackgroundDark:AppColors.Button1BackgroundLight),
      btnCancelColor: btn2Color ?? (_isDarkMode?AppColors.Button1BackgroundDark:AppColors.Button1BackgroundLight),
      headerAnimationLoop: false,
      dismissOnTouchOutside: true,
      buttonsTextStyle: _buttonTextStyle,
      titleTextStyle: _titleTextStyle(type),
      descTextStyle: _descTextStyle,
      onDismissCallback: (type) {
        // ضع هنا الفانكشن التي تريد تنفيذها عند الإغلاق
        print("Dialog closed");
        PopupHelper.thereIsAnOpenAlertNow = false;
      },
    );

    _dialog.show().then((_) {
      if (btn3Text != null) {
        showDialog(
          context: _context!,
          builder: (context) => AlertDialog(
            content: Text(_translate(btn3Text)! ?? ''),
            actions: [
              TextButton(
                onPressed: () {
                  PopupHelper.thereIsAnOpenAlertNow = false; // الكود المشترك
                  btn3OnPress?.call(); // استدعاء الدالة إذا لم تكن null
                 // Navigator.of(context).pop();
                },
                child: Text(_translate(btn3Text)! ?? ''),
              ),
            ],
          ),
        );
      }
    });
  }

  String? _translate(String? text, [String? variable]) {
    if (text == null) return null;
    String translated = AppLocalizations.of(_context!)!.tr(text);
    return variable != null ? "$translated \n $variable" : translated;
  }

  TextStyle get _buttonTextStyle => Theme.of(_context!)
      .textTheme
      .labelLarge!
      .copyWith(color: Colors.white );

  TextStyle _titleTextStyle(DialogType type) => Theme.of(_context!)
      .textTheme
      .headlineSmall!
      .copyWith(
    color: _getTitleColor(type),
    fontWeight: FontWeight.bold,
  );

  TextStyle get _descTextStyle => Theme.of(_context!)
      .textTheme
      .bodyMedium!
      .copyWith(
    color: _isDarkMode ? Colors.white70 : Colors.black,
  );

  Color _getTitleColor(DialogType type) {
    switch (type) {
      case DialogType.success:
        return _isDarkMode ? AppColors.successDark : AppColors.successLight;
      case DialogType.error:
        return _isDarkMode ? AppColors.errorDark : AppColors.errorLight;
      case DialogType.info:
        return _isDarkMode ? AppColors.infoDark : AppColors.infoLight;
      case DialogType.warning:
        return _isDarkMode ? AppColors.warningDark : AppColors.warningLight;
      default:
        return Colors.grey;
    }
  }
}
