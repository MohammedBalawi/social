// import 'dart:io';
//
// import 'package:marrige_app/config/app_config.dart';
// import 'package:marrige_app/libs/dataproviders/local/i_key_value_storage.dart';
// import 'package:marrige_app/libs/dataproviders/local/key_value_storage.dart';
// import 'package:marrige_app/libs/debug_it.dart';
//
// class ApiHeaders {
//   final String _tag = "ApiHeaders";
//
//   //toDo:inject storage in constructor
//   final IKeyValueStorage _storage = KeyValueStorage();
//
//   Map<String, dynamic> getHeaders()  {
//     // String? tokenUser = await _storage.getUserToken();
//     // DebugIT.printLog(
//     //     _tag, 'Get the stored user token $tokenUser from KeyValueStorage');
//
//     // tokenUser ??= '';
//     // DebugIT.printLog(_tag, 'If  token is null, use an empty string $tokenUser');
//
//     Map<String, dynamic> headers = {
//       'Content-Type': 'application/json',
//       'ByAppPOST': '1',
//       'ByDevice': _deviceType,
//       'ByStore': _store,
//       'UsingVersion': _version,
//       'AppWakeup': AppConfig.appWakeup,
//       'TokenUser': '',
//     };
//
//     DebugIT.printLog(_tag, 'Headers: $headers');
//     return headers;
//   }
//
//   String get _deviceType {
//     if (Platform.isAndroid) {
//       return '3';
//     }
//     if (Platform.isIOS) {
//       return '4';
//     }
//     return '0';
//   }
//
//   int get _store => AppConfig.androidStore;
//
//   String get _version => AppConfig.appVersion;
// }
