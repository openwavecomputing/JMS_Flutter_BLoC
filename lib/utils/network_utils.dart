import 'package:connectivity/connectivity.dart';

class NetworkUtils{

  // Singleton approach
  static final NetworkUtils _instance = NetworkUtils._internal();
  factory NetworkUtils() => _instance;
  NetworkUtils._internal();

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

}