class SpotlightModel {
  final String title;
  final String subtitle;
  final String price;
  final String image;

  SpotlightModel({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.image,
  });

  factory SpotlightModel.fromJson(Map<String, dynamic> json) {
    return SpotlightModel(
      title: json['title'],
      subtitle: json['subtitle'],
      price: json['price'],
      image: json['image'],
    );
  }
}
