class VerifyEmailModel {
  final String email;
  final String message;
  final String editText;
  final String saveAndResendText;
  final String resendMessage;

  VerifyEmailModel({
    required this.email,
    required this.message,
    required this.editText,
    required this.saveAndResendText,
    required this.resendMessage,
  });

  factory VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailModel(
      email: json['email'] ?? '',
      message: json['message'] ?? '',
      editText: json['editText'] ?? '',
      saveAndResendText: json['saveAndResendText'] ?? '',
      resendMessage: json['resendMessage'] ?? '',
    );
  }
}
