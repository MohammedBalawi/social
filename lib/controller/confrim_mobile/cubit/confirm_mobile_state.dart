import '../../../models/confirm_mobile/confirm_mobile_model.dart';

abstract class ConfirmMobileState {}

class ConfirmMobileInitial extends ConfirmMobileState {}

class ConfirmMobileLoading extends ConfirmMobileState {}

class ConfirmMobileLoaded extends ConfirmMobileState {
  final ConfirmMobileModel data;
  ConfirmMobileLoaded(this.data);
}

class ConfirmMobileError extends ConfirmMobileState {
  final String message;
  ConfirmMobileError(this.message);
}
