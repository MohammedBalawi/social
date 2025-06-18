import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marrige_app/controller/start/splash_cubit.dart';
import 'package:marrige_app/layouts/base_tab/base_tab_div.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..checkLoginStatus(),
      child: BlocListener<SplashCubit, bool?>(
        listener: (context, isLoggedIn) {
          if (isLoggedIn != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) =>  BaseTabDiv()
              ),
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Image.asset("assets/images/normal_popup_dark.png", width: 150),
          ),
        ),
      ),
    );
  }
}


