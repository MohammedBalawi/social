import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/rate/rate_us_model.dart';

class RateUsState {
  final bool isSubmitting;
  final bool isSuccess;

  RateUsState({
    required this.isSubmitting,
    required this.isSuccess,
  });

  factory RateUsState.initial() => RateUsState(
    isSubmitting: false,
    isSuccess: false,
  );

  RateUsState copyWith({
    bool? isSubmitting,
    bool? isSuccess,
  }) {
    return RateUsState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

class RateUsCubit extends Cubit<RateUsState> {
  RateUsCubit() : super(RateUsState.initial());

  Future<void> submitRating(RateUsModel model) async {
    emit(state.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(seconds: 2)); // simulate API
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }
}
