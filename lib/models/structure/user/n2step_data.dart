import 'package:marrige_app/models/structure/user/user_info_full_data.dart';

import 'base_item.dart';

class N2StepsData {
  final String? usersHideFullName;
  final List<BaseItem> listCities;
  final List<BaseItem> listFlags;
  final List<BaseItem> hairTypes;
  final List<BaseItem> hairColors;
  final List<BaseItem> eyesColor;
  final List<BaseItem> skinColor;
  final List<BaseItem> healthStatus;
  final List<BaseItem> deenState;
  final List<BaseItem> prayer;
  final List<BaseItem> lehya;
  final List<BaseItem> veil;
  final List<BaseItem> smoking;
  final List<BaseItem> listening2Music;
  final List<BaseItem> annualFinancial;
  final List<BaseItem> qualification;
  final List<BaseItem> workField;
  final List<BaseItem> financialSituation;
  final List<BaseItem> typeOFMarriage;
  final List<BaseItem> marriageTypesWanted;
  final List<BaseItem> maritalStatus;
  final List<BaseItem> doWantChildren;
  final List<BaseItem> wifeExpenseContribution;
  final List<BaseItem> wifeStudyWorkPermission;
  final List<BaseItem> relocationAcceptance;
  final List<BaseItem> postMarriageHousing;
  final String? usersMaxAboutOtherNum;
  final String? usersMaxAboutMeNum;
  final List<BaseItem> personalInterests;
  final int? beforeUpdateLen;
  final int? showAcceptSMS;
  final String? message;
  final String? aStatus;
  final int? goAddTalkout;
  final UserInfoFullData? userInfoFullData;

  N2StepsData({
    required this.usersHideFullName,
    required this.listFlags,
    this.listCities = const [],
    this.hairTypes = const [],
    this.hairColors = const [],
    this.eyesColor = const [],
    this.skinColor = const [],
    this.healthStatus = const [],
    this.deenState = const [],
    this.prayer = const [],
    this.lehya = const [],
    this.veil = const [],
    this.smoking = const [],
    this.listening2Music = const [],
    this.annualFinancial = const [],
    this.qualification = const [],
    this.workField = const [],
    this.financialSituation = const [],
    this.typeOFMarriage = const [],
    this.marriageTypesWanted = const [],
    this.maritalStatus = const [],
    this.doWantChildren = const [],
    this.wifeExpenseContribution = const [],
    this.wifeStudyWorkPermission = const [],
    this.relocationAcceptance = const [],
    this.postMarriageHousing = const [],
    this.personalInterests = const [],
    this.usersMaxAboutMeNum,
    this.usersMaxAboutOtherNum,
    this.beforeUpdateLen,
    this.showAcceptSMS,
    this.message,
    this.aStatus,
    this.goAddTalkout,
    this.userInfoFullData,
  });

  factory N2StepsData.fromJson(Map<String, dynamic> json) {
    return N2StepsData(
      usersHideFullName: json['UsersHideFullName'],
      listCities: _parse(json['ListCities']),
      listFlags: _parse(json['ListFlags']),
      hairTypes: _parse(json['HairType']),
      hairColors: _parse(json['HairColor']),
      eyesColor: _parse(json['EyesColor']),
      skinColor: _parse(json['SkinColor']),
      healthStatus: _parse(json['Health']),
      deenState: _parse(json['DeenState']),
      prayer: _parse(json['Prayer']),
      lehya: _parse(json['Lehya']),
      veil: _parse(json['Veil']),
      smoking: _parse(json['Smoking']),
      listening2Music: _parse(json['Listening2Music']),
      annualFinancial: _parse(json['AnnualFinancial']),
      qualification: _parse(json['Qualification']),
      workField: _parse(json['WorkField']),
      financialSituation: _parse(json['FinancialSituation']),
      typeOFMarriage: _parse(json['TypeOFMarriage']),
      marriageTypesWanted: _parse(json['MarriageTypesWanted']),
      maritalStatus: _parse(json['MaritalStatus']),
      doWantChildren: _parse(json['DoWantChildren']),
      wifeExpenseContribution: _parse(json['WifeExpenseContribution']),
      wifeStudyWorkPermission: _parse(json['WifeStudyWorkPermission']),
      relocationAcceptance: _parse(json['RelocationAcceptance']),
      postMarriageHousing: _parse(json['PostMarriageHousing']),
      personalInterests: _parse(json['PersonalInterests']),
      usersMaxAboutOtherNum: json['UsersMaxAboutOtherNum'],
      usersMaxAboutMeNum: json['UsersMaxAboutMeNum'],
      beforeUpdateLen: json['BeforeUpdateLen'],
      showAcceptSMS: json['ShowAcceptSMS'],
      message: json['Print'],
      aStatus: json['AStatus'],
      goAddTalkout: json['GoAddTalkout'],
      userInfoFullData: json['UserData'] != null
          ? UserInfoFullData.assignServerResponse(json['UserData'])
          : null,
    );
  }

  static List<BaseItem> _parse(dynamic jsonList) {
    if (jsonList is List) {
      return (jsonList).map((item) => BaseItem.fromMap(item)).toList();
    } else {
      return [];
    }
  }

  bool get isBeforeUpdateLen => (beforeUpdateLen ?? 0) > 0;

  bool get isUsersHideFullName => usersHideFullName == "1";
  bool get isAcceptSMSHidden => showAcceptSMS == 0;
}
