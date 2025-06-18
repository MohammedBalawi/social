import 'package:marrige_app/libs/debug_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityCheckerImpl {
  final _internetChecker = InternetConnectionChecker.instance;
  final String _tag = "ConnectivityCheckerImpl";

  Future<bool> hasConnection() async {
    DebugIT.printLog(_tag,
        'hasConnection method checks if the device has an active internet connection');
    return await _internetChecker.hasConnection;
  }

  Stream<bool> onConnectionStatusChanged() {
    DebugIT.printLog(_tag,
        'onConnectionStatusChanged method returns a stream that emits boolean values indicating the connection status.');
    return _internetChecker.onStatusChange.map((status) {
      return status == InternetConnectionStatus.connected;
    });
  }
}
