import 'package:flutter/material.dart';
import 'package:marrige_app/libs/connectivity/internet_connection_helper.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/main.dart';

class AppLifecycleManager extends StatefulWidget {
  const AppLifecycleManager({
    super.key,
    required this.child,
    required this.internetConnectionHelper,
  });
  final Widget child;
  final InternetConnectionHelper internetConnectionHelper;

  @override
  State<AppLifecycleManager> createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends State<AppLifecycleManager>
    with WidgetsBindingObserver {
  final String _tag = "AppLifecycleManager";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        DebugIT.printLog(_tag, 'App has resumed.');
        _checkInternetOnResume();
        break;

      case AppLifecycleState.inactive:
        DebugIT.printLog(_tag, 'App is inactive.');
        break;

      case AppLifecycleState.paused:
        DebugIT.printLog(_tag, 'App is paused.');
        break;

      case AppLifecycleState.detached:
        DebugIT.printLog(_tag, 'App is detached.');
        break;
      case AppLifecycleState.hidden:
        DebugIT.printLog(_tag, 'App is hidden.');
        break;
    }
  }

  Future<void> _checkInternetOnResume() async {
    DebugIT.printLog(_tag, 'Checking internet connection on resume.');

    // إضافة تأخير زمني قصير لضمان استقرار التطبيق
    await Future.delayed(const Duration(milliseconds: 500));

    // استخدام addPostFrameCallback لضمان أن واجهة المستخدم جاهزة
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final context = navigatorKey.currentContext;

      if (context != null) {
        DebugIT.printLog(
            _tag, 'Context is ready, checking internet connection.');
        try {
          await widget.internetConnectionHelper
              .checkConnectionAndShowError(context);
        } catch (error) {
          DebugIT.printLog(_tag, 'Error during internet check: $error');
        }
      } else {
        DebugIT.printLog(
            _tag, 'Navigator context is null, cannot show error popup.');
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    DebugIT.printLog(_tag, 'AppLifecycleManager observer removed.');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
