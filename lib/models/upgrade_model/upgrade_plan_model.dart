class UpgradePlanModel {
  final String title;
  final String days;
  final String months;
  final String weeklyPrice;
  final String fullPrice;
  final String saving;
  final bool isSpecial;

  UpgradePlanModel({
    required this.title,
    required this.days,
    required this.months,
    required this.weeklyPrice,
    required this.fullPrice,
    required this.saving,
    required this.isSpecial,
  });

  factory UpgradePlanModel.fromJson(Map<String, dynamic> json) {
    return UpgradePlanModel(
      title: json['title'],
      days: json['days'],
      months: json['months'],
      weeklyPrice: json['weeklyPrice'],
      fullPrice: json['fullPrice'],
      saving: json['saving'],
      isSpecial: json['isSpecial'],
    );
  }
}
