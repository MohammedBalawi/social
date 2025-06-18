class RateUsModel {
  final String message;

  RateUsModel({required this.message});

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}
