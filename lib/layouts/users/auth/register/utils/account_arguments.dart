import 'package:marrige_app/models/structure/user/account_info.dart';

class AccountArguments {
  final String? email;
  final String? username;
  final String? password;
  final RegisterInfo? registerInfo;
  final String? countryCode;
  final String? selectedDate;
  final String? countryId;
  final String? countryName;
  final int? genderId;
  final String? mobile;
  final int? days;
  final int? months;
  final int? years;
  final int? age;
  final String? registrationDate;
  final bool showRegistrationDate;
  final num numOfStep;
  AccountArguments({
    this.email,
    this.username,
    this.password,
    required this.registerInfo,
    this.countryCode,
    this.selectedDate,
    this.countryId,
    this.countryName,
    this.genderId,
    this.mobile,
    this.days,
    this.months,
    this.years,
    this.age,
    this.registrationDate,
    this.showRegistrationDate = false,
    required this.numOfStep,
  });

  AccountArguments copyWith({
    String? email,
    String? username,
    String? password,
    RegisterInfo? registerInfo,
    String? countryCode,
    String? selectedDate,
    String? countryId,
    String? countryName,
    int? genderId,
    String? mobile,
    int? days,
    int? months,
    int? years,
    int? age,
    String? registrationDate,
    bool? showRegistrationDate,
    num? numOfStep,
  }) {
    return AccountArguments(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      registerInfo: registerInfo ?? this.registerInfo,
      countryCode: countryCode ?? this.countryCode,
      selectedDate: selectedDate ?? this.selectedDate,
      countryId: countryId ?? this.countryId,
      countryName: countryName ?? this.countryName,
      genderId: genderId ?? this.genderId,
      mobile: mobile ?? this.mobile,
      days: days ?? this.days,
      months: months ?? this.months,
      years: years ?? this.years,
      age: age ?? this.age,
      registrationDate: registrationDate ?? this.registrationDate,
      showRegistrationDate: showRegistrationDate ?? this.showRegistrationDate,
      numOfStep: numOfStep ?? this.numOfStep,
    );
  }
}
