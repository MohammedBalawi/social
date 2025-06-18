import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/email_support/email_support_model.dart';

class EmailSupportState {
  final bool isSending;
  final bool isSuccess;
  final String? error;

  EmailSupportState({
    required this.isSending,
    required this.isSuccess,
    this.error,
  });

  factory EmailSupportState.initial() => EmailSupportState(
    isSending: false,
    isSuccess: false,
    error: null,
  );

  EmailSupportState copyWith({
    bool? isSending,
    bool? isSuccess,
    String? error,
  }) {
    return EmailSupportState(
      isSending: isSending ?? this.isSending,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}

class EmailSupportCubit extends Cubit<EmailSupportState> {
  EmailSupportCubit() : super(EmailSupportState.initial());

  Future<void> sendEmail(EmailSupportModel data) async {
    emit(state.copyWith(isSending: true, isSuccess: false));

    await Future.delayed(const Duration(seconds: 2)); // simulate network

    emit(state.copyWith(isSending: false, isSuccess: true));
  }
}
