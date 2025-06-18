import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/report_model/report_model.dart';

class ReportState {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  ReportState({
    required this.isSubmitting,
    required this.isSuccess,
    this.error,
  });

  factory ReportState.initial() => ReportState(
    isSubmitting: false,
    isSuccess: false,
    error: null,
  );

  ReportState copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return ReportState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(ReportState.initial());

  Future<void> submitReport(ReportModel report) async {
    emit(state.copyWith(isSubmitting: true, isSuccess: false));

    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    // simulate success
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }
}
