import 'package:flutter/material.dart';

class AppConfig {
  static const String baseUrl = 'http://192.168.137.1/marriage4sall/marriage_v6/Default/API/';
  static const String url = 'http://192.168.137.1/marriage4sall/marriage_v6/Default';
  static const String websocketUrl = 'ws://192.168.137.1:4000';
  static const bool enableDebugMode = true;
  static const String baseCaptchaUrl =
      '$url/Apps/Libs/SecurImage/securimage_show.php?sid=';
  static const String resetPasswordUrl = '$url/Users/RestPass';

  static int appWakeup = 1;
  static const String appVersion = '1.0.0+1';
  static const int androidStore = 1;
  static const String googleSignInClientID =
      '216571261639-7pc00204jmth6pau9gtctsv1gi9eb5m4.apps.googleusercontent.com';
  static const String appleSignInClientID =
      ''; //from apple developer please read doc for apple_signin package
  static const String appleSignInRedirectUri =
      ''; //from apple developer please read doc for apple_signin package
  static const String googleProviderKey = '3';
  static const String appleProviderKey = '5';
  static String get termOfUseUrl => '$url/UserConditions?Wlang=$appLang';
  static const int maxRecordingDuration = 180; // 3 minutes

  static String appLang = 'ar';
  static String arDefaultFont = 'DroidArabicKufi';

  static const List<Map<String, dynamic>> supportedLocales = [
    {'name': 'العربية', 'locale': Locale('ar')},
    {'name': 'English', 'locale': Locale('en')},
    {'name': 'Française', 'locale': Locale('fr')},
  ];


  static const baseImagePath="assets/images";
}
