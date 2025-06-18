import 'package:marrige_app/models/structure/validate_type_extension.dart';

class N1StepResponse {
  final String? needActiveNewAccount;
  final List<String>? sujNamesAvi;
  final String? message;
  final RowData? row;
  final int? registerDone;
  final String? afterStep1ShowStep2;

  N1StepResponse({
    this.needActiveNewAccount,
    this.sujNamesAvi,
    this.message,
    this.row,
    this.registerDone,
    this.afterStep1ShowStep2,
  });

  factory N1StepResponse.fromJson(Map<String, dynamic> json) {
    return N1StepResponse(
      needActiveNewAccount: json['NeedActiveNewAccount'],
      sujNamesAvi: validateType<List<String>>(json['SujNamesAvi']),
      message: json['Print'],
      row: validateType<RowData>(json['Row'], fromJson: RowData.fromJson),
      registerDone: json['RegDone'],
      afterStep1ShowStep2: json['GeneralConfig']?['AfterStep1ShowStep2'],
    );
  }

  bool get isNeedActiveNewAccount => needActiveNewAccount == '1';

  bool get hasSuggestedNames => sujNamesAvi != null;

  bool get isRegisterDone => registerDone == 1;

  bool get navigateToStep2 => afterStep1ShowStep2 == '1';
}

class RowData {
  final int? hideRegDateStatus;
  final String? regDateShow;
  final String? countryId;

  RowData({
    this.hideRegDateStatus,
    this.regDateShow,
    this.countryId,
  });

  factory RowData.fromJson(Map<String, dynamic> json) {
    return RowData(
      hideRegDateStatus: json['HideRegDateStatus'],
      regDateShow: json['RegDateShow'],
      countryId: json['CountryID'],
    );
  }

  bool get isRegDateVisible => hideRegDateStatus == 1;
}
