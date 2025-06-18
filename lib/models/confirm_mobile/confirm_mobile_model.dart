class ConfirmMobileModel {
  final String phone;
  final String message;

  ConfirmMobileModel({
    required this.phone,
    required this.message,
  });

  factory ConfirmMobileModel.fromJson(Map<String, dynamic> json) {
    return ConfirmMobileModel(
      phone: json['phone'],
      message: json['message'],
    );
  }
}
