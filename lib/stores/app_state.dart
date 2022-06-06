import 'package:flutter/cupertino.dart';
import 'package:mpi_front/models/models.dart';

class AppState extends ChangeNotifier {
  UserType activeUserType = UserType.unknown;

  AppState();
}
