import 'base_item.dart';

class RegisterInfo {
  final List<BaseItem> listFlags;
  final String? selectedCountryID;
  final Info info;
  final Map<String, String> flagsMobileCode;

  RegisterInfo({
    required this.listFlags,
    required this.selectedCountryID,
    required this.info,
    required this.flagsMobileCode,
  });

  factory RegisterInfo.fromJson(Map<String, dynamic> json) {
    return RegisterInfo(
      listFlags: (json['ListFlags'] as List)
          .map((flag) => BaseItem.fromMap(flag))
          .toList(),
      selectedCountryID: json['SelectedCountryID'].toString(),
      info: Info.fromJson(json['Info']),
      flagsMobileCode: Map<String, String>.from(json['FlagsMobileCode']),
    );
  }

  String getMobileCode() {
    return flagsMobileCode[selectedCountryID] ?? "00";
  }
}

class Info {
  final String? usersHideMobile;

  Info({
    required this.usersHideMobile,
  });

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      usersHideMobile: json['UsersHideMobile'],
    );
  }

  bool get isUsersHideMobile => usersHideMobile == "1";
}
