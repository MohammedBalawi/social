import 'package:google_sign_in/google_sign_in.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/libs/debug_it.dart';
import 'google_signin_service.dart';

class GoogleSignInServiceImpl extends GoogleSignInService {
  final String _tag = "GoogleSignInServiceImpl";

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
    clientId: AppConfig.googleSignInClientID,
  );

  GoogleSignInAccount? _currentUser;

  @override
  Future<GoogleSignInAccount?> signIn() async {
    if (_currentUser != null) {
      return _currentUser;
    }
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      DebugIT.printLog(_tag, 'Google Sign-In error: $error');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      DebugIT.printLog(_tag, 'User signed out successfully.');
    } catch (error) {
      DebugIT.printLog(_tag, 'Sign out error: $error');
    }
  }

  @override
  Future<String?> getIdToken() async {
    try {
      final GoogleSignInAccount? account =
          _googleSignIn.currentUser ?? await signIn();
      final GoogleSignInAuthentication auth = await account!.authentication;
      return auth.idToken;
    } catch (error) {
      DebugIT.printLog(_tag, 'Error retrieving ID Token: $error');
      return null;
    }
  }

  @override
  Future<String?> getAuthCode() async {
    try {
      final GoogleSignInAccount? account =
          _googleSignIn.currentUser ?? await signIn();
      return account?.serverAuthCode;
    } catch (error) {
      DebugIT.printLog(_tag, 'Error retrieving Auth Code: $error');
      return null;
    }
  }
}
