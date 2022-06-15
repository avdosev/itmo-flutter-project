import 'dart:convert';

import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/models/models.dart';
import 'package:http/http.dart' as http;

class Network {
  static Network get I => Network();

  final api = 'http://127.0.0.1:8080/api';

  Future<dynamic> get(String url) async {
    final resp = await http.get(Uri.parse(url), headers: {
      if (AuthService.I.token != null) 'Authorization': AuthService.I.token!,
    });
    final json = jsonDecode(resp.body);
    return json;
  }

  // Future<List<Order>> getOrders() async {}
}
