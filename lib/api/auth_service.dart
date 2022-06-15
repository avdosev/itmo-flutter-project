import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  static AuthService? _i;
  static AuthService get I {
    _i ??= AuthService();
    return _i!;
  }

  String? token;

  bool get isLogged => token != null;

  void authorize(String token) {
    this.token = token;
    notifyListeners();
  }

  void logout() {
    token = null;
    notifyListeners();
  }
}
