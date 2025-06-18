import 'dart:convert';
import 'package:marrige_app/models/structure/validate_type_extension.dart';

class UserInfoFullData {
  final int? id;
  final String? nationality;
  final String? countryID;
  final List<String>? marriageTypesWanted;
  final String? fullName;
  final String? cityName;
  final String? length;
  final String? weight;
  final String? hairType;
  final String? hairColor;
  final String? eyesColor;
  final String? skinColor;
  final String? health;
  final String? deenState;
  final String? prayer;
  final String? lehya;
  final String? veil;
  final String? smoking;
  final String? listening2Music;
  final String? qualification;
  final String? workField;
  final String? financialSituation;
  final String? annualFinancial;
  final String? typeOfMarriage;
  final String? maritalStatus;
  final String? numberOfChildren;
  final String? doWantChildren;
  final String? moreAboutMe;
  final String? moreAboutOther;
  final String? wifeExpenseContribution;
  final String? wifeStudyWorkPermission;
  final String? relocationAcceptance;
  final String? postMarriageHousing;
  final List<String>? personalInterests;
  final int? acceptSMS;
  final int? emailMeForNewUsers;
  final String? cityID;
  final List<String>? acceptedCoun;

  /// **Constructor**
  UserInfoFullData({
    this.id,
    this.nationality,
    this.countryID,
    this.marriageTypesWanted,
    this.fullName,
    this.cityName,
    this.length,
    this.weight,
    this.hairType,
    this.hairColor,
    this.eyesColor,
    this.skinColor,
    this.health,
    this.deenState,
    this.prayer,
    this.lehya,
    this.veil,
    this.smoking,
    this.listening2Music,
    this.qualification,
    this.workField,
    this.financialSituation,
    this.annualFinancial,
    this.typeOfMarriage,
    this.maritalStatus,
    this.numberOfChildren,
    this.doWantChildren,
    this.moreAboutMe,
    this.moreAboutOther,
    this.wifeExpenseContribution,
    this.wifeStudyWorkPermission,
    this.relocationAcceptance,
    this.postMarriageHousing,
    this.personalInterests,
    this.acceptSMS,
    this.emailMeForNewUsers,
    this.cityID,
    this.acceptedCoun,
  });

  /// **Factory constructor: Assign API response to class properties**
  factory UserInfoFullData.assignServerResponse(Map<String, dynamic> json) {
    return UserInfoFullData(
      id: json["id"],
      nationality: json["Nationality"]?.toString(),
      countryID: json["CountryID"]?.toString(),
      marriageTypesWanted:
          validateType<List<String>>(json['MarriageTypesWanted']),
      fullName: json["FullName"],
      cityName: json["CityName"],
      length: json["Length"]?.toString(),
      weight: json["Weight"]?.toString(),
      hairType: json["HairType"]?.toString(),
      hairColor: json["HairColor"]?.toString(),
      eyesColor: json["EyesColor"]?.toString(),
      skinColor: json["SkinColor"]?.toString(),
      health: json["Health"]?.toString(),
      deenState: json["DeenState"]?.toString(),
      prayer: json["Prayer"]?.toString(),
      lehya: json["Lehya"]?.toString(),
      veil: json["Veil"]?.toString(),
      smoking: json["Smoking"]?.toString(),
      listening2Music: json["Listening2Music"]?.toString(),
      qualification: json["Qualification"]?.toString(),
      workField: json["WorkField"]?.toString(),
      financialSituation: json["FinancialSituation"]?.toString(),
      annualFinancial: json["AnnualFinancial"]?.toString(),
      typeOfMarriage: json["TypeOFMarriage"]?.toString(),
      maritalStatus: json["MaritalStatus"]?.toString(),
      numberOfChildren: json["NumberOFChildren"]?.toString(),
      doWantChildren: json["DoWantChildren"],
      moreAboutMe: json["MoreAboutMe"],
      moreAboutOther: json["MoreAboutOther"],
      wifeExpenseContribution: json["WifeExpenseContribution"]?.toString(),
      wifeStudyWorkPermission: json["WifeStudyWorkPermission"]?.toString(),
      relocationAcceptance: json["RelocationAcceptance"]?.toString(),
      postMarriageHousing: json["PostMarriageHousing"]?.toString(),
      personalInterests: json["PersonalInterests"] != null
          ? List<String>.from(json["PersonalInterests"])
          : null,
      acceptSMS: json["AcceptSMS"],
      emailMeForNewUsers: json["EmailMeForNewUsers"],
      cityID: json["CityID"]?.toString(),
      acceptedCoun: json["AcceptedCoun"] != null
          ? List<String>.from(json["AcceptedCoun"])
          : null,
    );
  }

  /// **Convert class properties back to JSON for server requests**
  Map<String, dynamic> convertBackToServerRequest() {
    return {
      "Nationality": nationality,
      "CountryID": countryID,
      "MarriageTypesWanted": marriageTypesWanted,
      "TypeOFMarriage": typeOfMarriage,
      "FullName": fullName,
      "CityName": cityName,
      "Length": length,
      "Weight": weight,
      "HairType": hairType,
      "HairColor": hairColor,
      "EyesColor": eyesColor,
      "SkinColor": skinColor,
      "Health": health,
      "Listening2Music": listening2Music,
      "Qualification": qualification,
      "WorkField": workField,
      "FinancialSituation": financialSituation,
      "AnnualFinancial": annualFinancial,
      "DeenState": deenState,
      "Prayer": prayer,
      "Lehya": lehya,
      "Veil": veil,
      "Smoking": smoking,
      "DoWantChildren": doWantChildren,
      "MaritalStatus": maritalStatus,
      "WifeExpenseContribution": wifeExpenseContribution,
      "WifeStudyWorkPermission": wifeStudyWorkPermission,
      "RelocationAcceptance": relocationAcceptance,
      "PostMarriageHousing": postMarriageHousing,
      "acceptedCoun": acceptedCoun?.join(','),
      "NumberOFChildren": numberOfChildren ?? '0',
      "MoreAboutMe": moreAboutMe,
      "MoreAboutOther": moreAboutOther,
      "PersonalInterests": personalInterests?.join(','),
      "AcceptSMS": acceptSMS,
      "EmailMeForNewUsers": emailMeForNewUsers,
    };
  }

  /// **Convert to JSON string**
  String toJson() => json.encode(convertBackToServerRequest());

  /// **Convert from JSON string**
  factory UserInfoFullData.fromJson(String str) =>
      UserInfoFullData.assignServerResponse(json.decode(str));

  UserInfoFullData copyWith({
    int? id,
    String? userTypeID,
    String? userName,
    String? email,
    String? nationality,
    String? countryID,
    List<String>? marriageTypesWanted,
    String? fullName,
    String? cityName,
    String? length,
    String? weight,
    String? hairType,
    String? hairColor,
    String? eyesColor,
    String? skinColor,
    String? health,
    String? deenState,
    String? prayer,
    String? lehya,
    String? veil,
    String? smoking,
    String? listening2Music,
    String? qualification,
    String? workField,
    String? financialSituation,
    String? annualFinancial,
    String? typeOfMarriage,
    String? maritalStatus,
    String? numberOfChildren,
    String? doWantChildren,
    String? moreAboutMe,
    String? moreAboutOther,
    String? wifeExpenseContribution,
    String? wifeStudyWorkPermission,
    String? relocationAcceptance,
    String? postMarriageHousing,
    List<String>? personalInterests,
    int? acceptSMS,
    int? emailMeForNewUsers,
    String? cityID,
    List<String>? acceptedCoun,
  }) {
    return UserInfoFullData(
      id: id ?? this.id,
      nationality: nationality ?? this.nationality,
      countryID: countryID ?? this.countryID,
      marriageTypesWanted: marriageTypesWanted ?? this.marriageTypesWanted,
      fullName: fullName ?? this.fullName,
      cityName: cityName ?? this.cityName,
      length: length ?? this.length,
      weight: weight ?? this.weight,
      hairType: hairType ?? this.hairType,
      hairColor: hairColor ?? this.hairColor,
      eyesColor: eyesColor ?? this.eyesColor,
      skinColor: skinColor ?? this.skinColor,
      health: health ?? this.health,
      deenState: deenState ?? this.deenState,
      prayer: prayer ?? this.prayer,
      lehya: lehya ?? this.lehya,
      veil: veil ?? this.veil,
      smoking: smoking ?? this.smoking,
      listening2Music: listening2Music ?? this.listening2Music,
      qualification: qualification ?? this.qualification,
      workField: workField ?? this.workField,
      financialSituation: financialSituation ?? this.financialSituation,
      annualFinancial: annualFinancial ?? this.annualFinancial,
      typeOfMarriage: typeOfMarriage ?? this.typeOfMarriage,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      doWantChildren: doWantChildren ?? this.doWantChildren,
      moreAboutMe: moreAboutMe ?? this.moreAboutMe,
      moreAboutOther: moreAboutOther ?? this.moreAboutOther,
      wifeExpenseContribution:
          wifeExpenseContribution ?? this.wifeExpenseContribution,
      wifeStudyWorkPermission:
          wifeStudyWorkPermission ?? this.wifeStudyWorkPermission,
      relocationAcceptance: relocationAcceptance ?? this.relocationAcceptance,
      postMarriageHousing: postMarriageHousing ?? this.postMarriageHousing,
      personalInterests: personalInterests ?? this.personalInterests,
      acceptSMS: acceptSMS ?? this.acceptSMS,
      emailMeForNewUsers: emailMeForNewUsers ?? this.emailMeForNewUsers,
      cityID: cityID ?? this.cityID,
      acceptedCoun: acceptedCoun ?? this.acceptedCoun,
    );
  }
}
