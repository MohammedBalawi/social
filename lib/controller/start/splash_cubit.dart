import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/controller/shared/user_data_storage.dart';
import 'package:marrige_app/libs/debug_it.dart';

class SplashCubit extends Cubit<bool?> {
  SplashCubit() : super(null);
  static const _tag = 'SplashCubit';
  void checkLoginStatus() async {
    DebugIT.printLog(_tag, "start splash screen cubit");

    await Future.delayed(Duration(seconds: 2));
    final isLoggedIn =(await UserDataStorage.getUserInfo() != null);
    emit(isLoggedIn);
  }
}