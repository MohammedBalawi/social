import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvatarState {
  final bool isLoading;
  final List<String> avatars;

  AvatarState({required this.isLoading, required this.avatars});

  AvatarState copyWith({bool? isLoading, List<String>? avatars}) {
    return AvatarState(
      isLoading: isLoading ?? this.isLoading,
      avatars: avatars ?? this.avatars,
    );
  }
}

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(AvatarState(isLoading: true, avatars: []));

  Future<void> loadAvatars() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1)); // محاكاة للتحميل

    final String response = await rootBundle.loadString('assets/json/avatars.json');
    final data = json.decode(response);
    final List<String> avatarUrls = List<String>.from(data['avatars']);

    emit(AvatarState(isLoading: false, avatars: avatarUrls));
  }
}
