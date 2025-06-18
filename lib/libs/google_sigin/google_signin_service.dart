

abstract class GoogleSignInService {
  Future<dynamic> signIn();

  Future<void> signOut();

  Future<String?> getIdToken();

  Future<String?> getAuthCode();
}
