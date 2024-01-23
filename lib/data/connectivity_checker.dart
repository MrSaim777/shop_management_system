import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isNetworkAvailable() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}