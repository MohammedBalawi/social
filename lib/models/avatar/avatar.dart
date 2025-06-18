
class AvatarModel {
  final String imageUrl;

  AvatarModel({required this.imageUrl});

  factory AvatarModel.fromJson(Map<String, dynamic> json) {
    return AvatarModel(imageUrl: json['']);
  }
}
