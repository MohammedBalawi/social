class LoginResponse {
  final String? loginToken;
  final String? message;
  final String? aStatus;

  LoginResponse({
    this.loginToken,
    this.message,
    this.aStatus,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      loginToken: json['UserInfo']?['LoginToken'],
      message: json['Print'],
      aStatus: json['AStatus'],
    );
  }
}
