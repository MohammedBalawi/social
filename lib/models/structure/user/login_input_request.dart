class LoginRequest {
  final String username;
  final String password;
  final int reactiveite;

  LoginRequest({
    required this.username,
    required this.password,
    this.reactiveite = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'UserName': username,
      'Password': password,
      'Reactiveit': reactiveite,
    };
  }
}
