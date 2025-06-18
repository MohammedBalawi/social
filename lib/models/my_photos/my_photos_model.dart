
class PhotoItemModel {
  final String imgPath;
  bool hidden;

  PhotoItemModel({required this.imgPath, this.hidden = false});

  factory PhotoItemModel.fromJson(Map<String, dynamic> json) {
    return PhotoItemModel(
      imgPath: json['imgPath'] ?? '',
      hidden: json['hidden'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'imgPath': imgPath,
    'hidden': hidden,
  };
}
