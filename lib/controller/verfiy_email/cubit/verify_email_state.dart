import '../../../models/verfiy_email/verfiy_email_model.dart';

abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailLoaded extends VerifyEmailState {
  final VerifyEmailModel data;
  VerifyEmailLoaded(this.data);
}

class VerifyEmailError extends VerifyEmailState {
  final String message;
  VerifyEmailError(this.message);
}
