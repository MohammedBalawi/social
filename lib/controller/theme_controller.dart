import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


enum ThemeEvent { toggle, system }

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.system));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:

        yield ThemeState(
          themeMode: state.themeMode == ThemeMode.dark
              ? ThemeMode.light
              : ThemeMode.dark,
        );
        break;
      case ThemeEvent.system:
      
        yield ThemeState(themeMode: ThemeMode.system);
        break;
    }
  }
}
