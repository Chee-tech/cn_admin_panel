import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkChecker {
  Future<bool> checkInternetConnection() async {
    return await InternetConnection().hasInternetAccess;
  }
}
