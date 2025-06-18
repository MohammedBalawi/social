
class ReportModel {
  final String reportUsername;
  final String placeOfViolation;
  final String typeOfViolation;
  final String details;

  ReportModel({
    required this.reportUsername,
    required this.placeOfViolation,
    required this.typeOfViolation,
    required this.details,
  });

  Map<String, dynamic> toJson() => {
    'report_username': reportUsername,
    'place_of_violation': placeOfViolation,
    'type_of_violation': typeOfViolation,
    'details': details,
  };
}
