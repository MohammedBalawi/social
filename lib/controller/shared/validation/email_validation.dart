import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailValidationState {
  final bool isValid;
  final bool showValidation;

  EmailValidationState({required this.isValid, required this.showValidation});
}

class EmailValidationCubit extends Cubit<EmailValidationState> {
  final TextEditingController emailController = TextEditingController();

  EmailValidationCubit()
      : super(EmailValidationState(isValid: false, showValidation: false));

  void validateEmail() {
    final email = emailController.text.trim();
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final isValid = email.isNotEmpty && emailRegex.hasMatch(email);
    emit(EmailValidationState(
        isValid: isValid, showValidation: state.showValidation));
  }

  void toggleValidationVisibility() {
    emit(
      EmailValidationState(
        isValid: state.isValid,
        showValidation: true,
      ),
    );
  }
}
