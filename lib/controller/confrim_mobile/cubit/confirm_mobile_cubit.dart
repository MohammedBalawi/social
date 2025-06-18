import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/confirm_mobile/confirm_mobile_model.dart';
import 'confirm_mobile_state.dart';

class ConfirmMobileCubit extends Cubit<ConfirmMobileState> {
  ConfirmMobileCubit() : super(ConfirmMobileInitial());

  Future<void> loadDataFromJson() async {
    emit(ConfirmMobileLoading());
    try {
      final String response = await rootBundle.loadString('assets/json/confirm_mobile_data.json');
      final data = ConfirmMobileModel.fromJson(json.decode(response));
      emit(ConfirmMobileLoaded(data));
    } catch (e) {
      emit(ConfirmMobileError("Failed to load data"));
    }
  }
}
