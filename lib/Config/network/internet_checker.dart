// import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetChecker {
  Future<bool> get isConnected;
}

class InternetCheckerImplem implements InternetChecker {
  @override
  Future<bool> get isConnected => Future.value(true);
}
