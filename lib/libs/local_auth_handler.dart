import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'package:marrige_app/libs/lang/lang.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LocalAuthHandler {
  final String _tag = "LocalAuthFingerPrint";

  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> canAuthWithBiometrics() async {
    final canAuthWithBiometrics = await _auth.canCheckBiometrics;
    DebugIT.printLog(
        _tag, 'Can Device Auth With Biometrics $canAuthWithBiometrics');
    return canAuthWithBiometrics;
  }

  Future<bool> signWithFingerPrint(BuildContext context) async {
    if (await canAuthWithBiometrics()) {
      if (!context.mounted) {
        return false;
      }
      try {
        final didAuthenticate = await _auth.authenticate(
            localizedReason:
                AppLocalizations.of(context)!.tr('fingerprint_authenticate'),
            options: const AuthenticationOptions(
              biometricOnly: true,
              stickyAuth: true,
              useErrorDialogs: false,
            ),
            authMessages: <AuthMessages>[
              AndroidAuthMessages(
                signInTitle:
                    AppLocalizations.of(context)!.tr('authentication_required'),
                biometricHint:
                    AppLocalizations.of(context)!.tr('verify_identity'),
                cancelButton: AppLocalizations.of(context)!.tr('cancel'),
                goToSettingsDescription: 'Please set up your Touch ID.',
                biometricNotRecognized: 't up your Touch ID',
              ),
            ]);
        return didAuthenticate;
      } catch (e) {
        DebugIT.printLog(_tag, 'Local auth error: $e');

        return false;
      }
    }

    return false;
  }
}
