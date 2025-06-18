import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FontEvent {}

class UpdateFontScale extends FontEvent {
  final double scale;

  UpdateFontScale(this.scale);

}

class FontState {
  final double fontScale;

  FontState({required this.fontScale});
}

class FontBloc extends Bloc<FontEvent, FontState> {
  FontBloc() : super(FontState(fontScale: 1.0)) {
    on<UpdateFontScale>((event, emit) {
      emit(FontState(fontScale: event.scale));
    });
  }
}
