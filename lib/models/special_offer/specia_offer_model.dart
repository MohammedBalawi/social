class SpecialOfferModel {
  final String title;
  final String price;
  final String currency;
  final String usdPrice;
  final String discount;
  final String details;

  SpecialOfferModel({
    required this.title,
    required this.price,
    required this.currency,
    required this.usdPrice,
    required this.discount,
    required this.details,
  });

  factory SpecialOfferModel.fromJson(Map<String, dynamic> json) {
    return SpecialOfferModel(
      title: json['title'],
      price: json['price'],
      currency: json['currency'],
      usdPrice: json['usdPrice'],
      discount: json['discount'],
      details: json['details'],
    );
  }
}
