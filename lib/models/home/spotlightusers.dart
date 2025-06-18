class SpotlightUser {
  final int userID;
  final String userName;
  final String country;
  final String profileImage;
  final String age;
  
  SpotlightUser({
    required this.userID,
    required this.userName,
    required this.country,
    required this.profileImage,
    required this.age,
  });

  factory SpotlightUser.fromJson(Map<String, dynamic> json) {
    return SpotlightUser(
      userID: json['UserID'],
      userName: json['UserName'],
      country: json['Country'],
      profileImage: json['ProfileImage'],
      age: json['Age'],
    );
  }
}

class DataUser {
  final int id;
  final String userName;
  final String sex;
  final String age;
  final String country;
  final String profileImage;
  
  DataUser({
    required this.id,
    required this.userName,
    required this.sex,
    required this.age,
    required this.country,
    required this.profileImage,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) {
    return DataUser(
      id: json['id'],
      userName: json['UserName'],
      sex: json['Sex'],
      age: json['Age'],
      country: json['CountryID'],
      profileImage: json['ProfileImage'],
    );
  }
}
