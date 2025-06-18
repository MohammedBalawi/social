class RegisterRequest {
  final String? email;
  final String? countryId;
  final String? birthday;
  final String? mobile;
  final String? username;
  final String? password;
  final String? rePassword;
  final int? sex;

  RegisterRequest({
    required this.email,
    required this.countryId,
    required this.birthday,
    required this.mobile,
    required this.username,
    required this.password,
    required this.rePassword,
    required this.sex,
  });

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'CountryID': countryId,
      'Birthday': birthday,
      'Mobile': mobile,
      'UserName': username,
      'Password': password,
      'RePassword': rePassword,
      'Sex': sex,
    };
  }
}
