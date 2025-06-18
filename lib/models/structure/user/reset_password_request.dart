// reset_password_request.dart

class ResetPasswordRequest {
  final String userName;
  final String captcha;

  ResetPasswordRequest({required this.userName, required this.captcha});

  Map<String, dynamic> toJson() {
    return {
      'UserName': userName,
      'captcha': captcha,
    };
  }
}
