import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/libs/debug_it.dart';

abstract class ThemeEvent {}

class SetThemeMode extends ThemeEvent {
  final ThemeMode themeMode;

  SetThemeMode(this.themeMode);
}

class ThemeState {
  final ThemeMode themeMode;

  ThemeState({required this.themeMode});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final String _tag = "ThemeBloc";

  ThemeBloc() : super(ThemeState(themeMode: ThemeMode.system)) {
    on<SetThemeMode>(
      (event, emit) {
        DebugIT.printLog(_tag, 'set the theme of app ${state.themeMode}');
        emit(ThemeState(themeMode: state.themeMode));
      },
    );
  }

  /// Toggles the current theme between [ThemeMode.dark] and [ThemeMode.light].
  /// Useful for manual theme switching during development or debugging.
  /// It reads the current theme mode from the state, flips it, logs the change,
  /// and emits a new [ThemeState] using [SetThemeMode] event.
  void toggleTheme() {
    final isDark = state.themeMode == ThemeMode.dark;
    final newTheme = isDark ? ThemeMode.light : ThemeMode.dark;
    DebugIT.printLog(_tag, 'Theme toggled to: $newTheme');
    add(SetThemeMode(newTheme));
  }

}
