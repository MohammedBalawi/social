
import '../../../models/special_offer/specia_offer_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialOfferState {
  final bool isLoading;
  final SpecialOfferModel? offer;

  SpecialOfferState({required this.isLoading, this.offer});

  SpecialOfferState copyWith({
    bool? isLoading,
    SpecialOfferModel? offer,
  }) {
    return SpecialOfferState(
      isLoading: isLoading ?? this.isLoading,
      offer: offer ?? this.offer,
    );
  }
}

class SpecialOfferCubit extends Cubit<SpecialOfferState> {
  SpecialOfferCubit() : super(SpecialOfferState(isLoading: true));

  Future<void> loadOffer() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2));

    final String response = await rootBundle.loadString('assets/json/special_offer.json');
    final data = json.decode(response);

    final offer = SpecialOfferModel.fromJson(data);

    emit(SpecialOfferState(isLoading: false, offer: offer));
  }
}
