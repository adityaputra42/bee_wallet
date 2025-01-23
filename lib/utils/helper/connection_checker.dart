import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();

  if (connectivityResult.any(
      (c) => c == ConnectivityResult.mobile || c == ConnectivityResult.wifi)) {
    return true;
  } else {
    return false;
  }
}
