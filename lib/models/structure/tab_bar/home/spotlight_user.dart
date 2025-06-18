
class SpotlightUsers {
  int? userID;
  String? userName;
  int? countryID;
  String? birthday;
  int? reviewProfileIMG;
  String? profileImage;
  String? profileImageHidden;
  int? nationality;
  int? sex;
  String? age;
  String? country;

  SpotlightUsers(
      {this.userID,
        this.userName,
        this.countryID,
        this.birthday,
        this.reviewProfileIMG,
        this.profileImage,
        this.profileImageHidden,
        this.nationality,
        this.sex,
        this.age,
        this.country});

  SpotlightUsers.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    userName = json['UserName'];
    countryID = json['CountryID'];
    birthday = json['Birthday'];
    reviewProfileIMG = json['ReviewProfileIMG'];
    profileImage = json['ProfileImage'];
    profileImageHidden = json['ProfileImageHidden'];
    nationality = json['Nationality'];
    sex = json['Sex'];
    age = json['Age'];
    country = json['Country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['UserName'] = this.userName;
    data['CountryID'] = this.countryID;
    data['Birthday'] = this.birthday;
    data['ReviewProfileIMG'] = this.reviewProfileIMG;
    data['ProfileImage'] = this.profileImage;
    data['ProfileImageHidden'] = this.profileImageHidden;
    data['Nationality'] = this.nationality;
    data['Sex'] = this.sex;
    data['Age'] = this.age;
    data['Country'] = this.country;
    return data;
  }
}