import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import '../../../models/verfiy_email/verfiy_email_model.dart';
import 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit() : super(VerifyEmailInitial());

  Future<void> loadVerifyEmailData() async {
    emit(VerifyEmailLoading());
    try {
      final response = await rootBundle.loadString('assets/json/verify_email.json');
      final jsonData = json.decode(response);
      final model = VerifyEmailModel.fromJson(jsonData);
      emit(VerifyEmailLoaded(model));
    } catch (e) {
      emit(VerifyEmailError("Failed to load data: $e"));
    }
  }
}
