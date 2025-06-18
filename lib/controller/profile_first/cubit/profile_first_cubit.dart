// profile_state.dart

import '../../../models/profile_first/profile_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProfileState {
  final bool isLoading;
  final ProfileModel? profile;

  ProfileState({required this.isLoading, this.profile});

  ProfileState copyWith({bool? isLoading, ProfileModel? profile}) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
    );
  }
}
// profile_cubit.dart

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(isLoading: true));

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 2)); // Simulate loading
    final String response = await rootBundle.loadString('assets/json/profile.json');
    final data = json.decode(response);
    final profile = ProfileModel.fromJson(data);
    emit(ProfileState(isLoading: false, profile: profile));
  }
}
