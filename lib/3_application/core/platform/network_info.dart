import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> get isConnected async {
    var connectivity = Connectivity();
    var result = await connectivity.checkConnectivity();
    connectivity.onConnectivityChanged.listen((event) {
      result = event;
    });

    switch (result) {
      case ConnectivityResult.wifi:
        return true;

      case ConnectivityResult.mobile:
        return true;

      default:
        return false;
    }
  }
}
