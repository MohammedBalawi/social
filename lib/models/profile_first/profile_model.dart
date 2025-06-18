class ProfileModel {
  final String name;
  final String nationality;
  final String location;
  final String age;
  final String types;
  final String bio;
  final String moreInfo;
  final List<String> socialIcons;
  final List<Map<String, String>> personalInfo;

  ProfileModel({
    required this.name,
    required this.nationality,
    required this.location,
    required this.age,
    required this.types,
    required this.bio,
    required this.moreInfo,
    required this.socialIcons,
    required this.personalInfo,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      nationality: json['nationality'],
      location: json['location'],
      age: json['age'],
      types: json['types'],
      bio: json['bio'],
      moreInfo: json['moreInfo'],
      socialIcons: List<String>.from(json['socialIcons']),
      personalInfo: List<Map<String, String>>.from(
        json['personalInfo'].map((e) => Map<String, String>.from(e)),
      ),
    );
  }
}
