
class MainBlockUserData {
  int? id;
  int? userTypeID;
  String? sex;
  String? userName;
  String? birthday;
  String? countryID;
  int? reviewProfileIMG;
  String? profileImage;
  String? marriageTypesWanted;
  int? reivewByAdmin;
  int? lastLogin;
  String? profileImageHidden;
  String? iSOCode;
  String? age;
  int? ageOnly;
  String? inHisFav;
  int? sexByNum;
  String? typeIcon;
  String? sendPMIcon;
  TalkoutMainBlock? talkOut;
  int? talkOutEmail;
  int? talkOutMobile;

  MainBlockUserData(
      {this.id,
        this.userTypeID,
        this.sex,
        this.userName,
        this.birthday,
        this.countryID,
        this.reviewProfileIMG,
        this.profileImage,
        this.marriageTypesWanted,
        this.reivewByAdmin,
        this.lastLogin,
        this.profileImageHidden,
        this.iSOCode,
        this.age,
        this.ageOnly,
        this.inHisFav,
        this.sexByNum,
        this.typeIcon,
        this.sendPMIcon,
        this.talkOut,
        this.talkOutEmail,
        this.talkOutMobile
      });

  MainBlockUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userTypeID = json['UserTypeID'];
    sex = json['Sex'];
    userName = json['UserName'];
    birthday = json['Birthday'];
    countryID = json['CountryID'];
    reviewProfileIMG = json['ReviewProfileIMG'];
    profileImage = json['ProfileImage'];
    marriageTypesWanted = json['MarriageTypesWanted'];
    reivewByAdmin = json['ReivewByAdmin'];
    lastLogin = json['LastLogin'];
    profileImageHidden = json['ProfileImageHidden'];
    iSOCode = json['ISOCode'];
    age = json['Age'];
    ageOnly = json['AgeOnly'];
    inHisFav = json['InHisFav'];
    sexByNum = json['SexByNum'];
    typeIcon = json['TypeIcon'];
    sendPMIcon = json['SendPMIcon'];
    talkOut =
    json['TalkOut'] != null ? new TalkoutMainBlock.fromJson(json['TalkOut']) : null;
    talkOutEmail = json['TalkOutEmail'];
    talkOutMobile = json['TalkOutMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['UserTypeID'] = this.userTypeID;
    data['Sex'] = this.sex;
    data['UserName'] = this.userName;
    data['Birthday'] = this.birthday;
    data['CountryID'] = this.countryID;
    data['ReviewProfileIMG'] = this.reviewProfileIMG;
    data['ProfileImage'] = this.profileImage;
    data['MarriageTypesWanted'] = this.marriageTypesWanted;
    data['ReivewByAdmin'] = this.reivewByAdmin;
    data['LastLogin'] = this.lastLogin;
    data['ProfileImageHidden'] = this.profileImageHidden;
    data['ISOCode'] = this.iSOCode;
    data['Age'] = this.age;
    data['AgeOnly'] = this.ageOnly;
    data['InHisFav'] = this.inHisFav;
    data['SexByNum'] = this.sexByNum;
    data['TypeIcon'] = this.typeIcon;
    data['SendPMIcon'] = this.sendPMIcon;
    if (this.talkOut != null) {
      data['TalkOut'] = this.talkOut!.toJson();
    }
    data['TalkOutEmail'] = this.talkOutEmail;
    data['TalkOutMobile'] = this.talkOutMobile;
    return data;
  }
}


class TalkoutMainBlock {
  int? email;
  int? mobile;
  int? facebook;
  int? twitter;
  int? bBM;

  TalkoutMainBlock({this.email, this.mobile, this.facebook, this.twitter, this.bBM});

  TalkoutMainBlock.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    mobile = json['Mobile'];
    facebook = json['Facebook'];
    twitter = json['Twitter'];
    bBM = json['BBM'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['Mobile'] = this.mobile;
    data['Facebook'] = this.facebook;
    data['Twitter'] = this.twitter;
    data['BBM'] = this.bBM;
    return data;
  }
}