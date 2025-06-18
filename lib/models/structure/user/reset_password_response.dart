class ResetPasswordResponse {
  final int status;
  final String? printMessage;
  final int capachaError;
  final int isSocialUser;
  final String? resultMessage;

  ResetPasswordResponse({
    required this.status,
    this.printMessage,
    this.capachaError = 0,
    this.isSocialUser = 0,
    this.resultMessage,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> map) {
    final dynamic msgs = map['MSGs'];

    return ResetPasswordResponse(
      status: map['Status'] ?? 0,
      printMessage: msgs is List && msgs.isNotEmpty
          ? msgs.first.toString()
          : msgs is Map
              ? msgs['Print'] as String?
              : null,
      capachaError: msgs is Map ? msgs['CapachaError'] ?? 0 : 0,
      isSocialUser: msgs is Map ? msgs['ISSocialUser'] ?? 0 : 0,
      resultMessage: msgs is Map ? msgs['Result'] as String? : null,
    );
  }

  bool get hasCapachaError => capachaError == 1;

  bool get isSuccessful => status == 1;

  bool get requiresSocialLogin => status == 0 && isSocialUser == 1;

  bool get hasResultMessage =>
      resultMessage != null && resultMessage!.isNotEmpty;
}
