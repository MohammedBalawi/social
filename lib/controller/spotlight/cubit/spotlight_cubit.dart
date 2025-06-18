import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/spotlight/spotlight_model.dart';
import 'spotlight_state.dart';

class SpotlightCubit extends Cubit<SpotlightState> {
  SpotlightCubit() : super(SpotlightLoading());

  Future<void> loadSpotlightData() async {
    emit(SpotlightLoading());
    try {
      final jsonString = await rootBundle.loadString('assets/json/spotlight_data.json');
      final jsonList = json.decode(jsonString) as List;
      final items = jsonList.map((e) => SpotlightModel.fromJson(e)).toList();
      emit(SpotlightLoaded(items));
    } catch (e) {
      emit(SpotlightError(e.toString()));
    }
  }
}
