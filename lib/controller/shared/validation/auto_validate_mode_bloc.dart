import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/libs/debug_it.dart';

class AutoValidateModeBloc extends Cubit<AutoValidateModeState> {
  final String _tag = "AutoValidateModeBloc";

  AutoValidateModeBloc() : super(AutoValidateModeState.initial());

  void enableAutoValidate() {
    emit(AutoValidateModeState(autoValidateMode: AutovalidateMode.always));
    DebugIT.printLog(
        _tag, 'Enable autoValidation mode AutoValidateMode.always');
  }
}

class AutoValidateModeState {
  final AutovalidateMode autoValidateMode;

  AutoValidateModeState({required this.autoValidateMode});

  // Initial state: validation disabled
  factory AutoValidateModeState.initial() {
    DebugIT.printLog('AutoValidateModeState',
        'Initial autoValidation mode AutoValidateMode.disabled');
    return AutoValidateModeState(autoValidateMode: AutovalidateMode.disabled);
  }
}
