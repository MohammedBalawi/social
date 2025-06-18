import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/addtional_ways_to_contact/additional_contact_settings_model.dart';

class AdditionalContactState {
  final AdditionalContactSettingsModel? settings;
  final bool isLoading;

  AdditionalContactState({this.settings, this.isLoading = false});

  AdditionalContactState copyWith({
    AdditionalContactSettingsModel? settings,
    bool? isLoading,
  }) {
    return AdditionalContactState(
      settings: settings ?? this.settings,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AdditionalContactCubit extends Cubit<AdditionalContactState> {
  AdditionalContactCubit() : super(AdditionalContactState(isLoading: true));

  Future<void> loadContactSettings() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(milliseconds: 800));
    final String response = await rootBundle.loadString('assets/json/additional_contact_settings.json');
    final Map<String, dynamic> data = json.decode(response);
    final model = AdditionalContactSettingsModel.fromJson(data);
    emit(state.copyWith(settings: model, isLoading: false));
  }
}
