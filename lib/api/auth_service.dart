import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  static AuthService? _i;
  static AuthService get I {
    _i ??= AuthService();
    return _i!;
  }

  String? token;

  bool get isLogged => token != null;

  void register() async {}

  void login() async {}

  void logout() async {}
}
