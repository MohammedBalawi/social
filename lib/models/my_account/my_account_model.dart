class MyAccountModel {
  final String username;
  final int age;
  final String location;
  final String imageUrl;
  final bool hasCompletedAccount;
  final bool hasConfirmedPhone;

  MyAccountModel({
    required this.username,
    required this.age,
    required this.location,
    required this.imageUrl,
    required this.hasCompletedAccount,
    required this.hasConfirmedPhone,
  });

  factory MyAccountModel.fromJson(Map<String, dynamic> json) {
    return MyAccountModel(
      username: json['username'],
      age: json['age'],
      location: json['location'],
      imageUrl: json['imageUrl'],
      hasCompletedAccount: json['hasCompletedAccount'],
      hasConfirmedPhone: json['hasConfirmedPhone'],
    );
  }
}
