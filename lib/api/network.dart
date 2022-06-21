import 'dart:convert';

import 'package:itertools/itertools.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/models/models.dart';
import 'package:http/http.dart' as http;

class Network {
  static Network get I => Network();

  final api = 'http://127.0.0.1:8080/api';

  Future<dynamic> get(String url) async {
    print(AuthService.I.token);
    final resp = await http.get(Uri.parse(url), headers: {
      if (AuthService.I.token != null)
        'Authorization': 'Bearer ${AuthService.I.token!}',
      'Content-Type': 'application/json',
    });
    final body = Utf8Decoder().convert(resp.bodyBytes);
    print('--request--');
    print(url);
    print(resp.statusCode);
    print(resp.headers);
    print(body);
    print('--request--');
    final json = jsonDecode(body);
    return json;
  }

  Future<dynamic> post(String url, [Map<String, dynamic>? json]) async {
    print(AuthService.I.token);
    final resp = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        if (AuthService.I.token != null)
          'Authorization': 'Bearer ${AuthService.I.token!}',
      },
      body: json == null ? null : jsonEncode(json),
    );
    final body = Utf8Decoder().convert(resp.bodyBytes);
    print('--request--');
    print(url);
    print(resp.statusCode);
    print(resp.headers);
    print(jsonEncode(json));
    print(body);
    print('--request--');
    final resJson = jsonDecode(body);
    return resJson;
  }

  Future<AuthState> register({
    required String email,
    required String password,
    required UserType role,
  }) {
    return post('$api/auth/register', {
      'email': email,
      'password': password,
      'roleId': role.id,
    }).map.then(AuthState.fromJson);
  }

  Future<AuthState> login({
    required String email,
    required String password,
  }) {
    return post('$api/auth/login', {
      'email': email,
      'password': password,
    }).map.then(AuthState.fromJson);
  }

  Future<List<Artifact>> templates() {
    return get('$api/artifacts').list.then((e) => e.mapList(Artifact.fromJson));
  }

  Future<List<Order>> orders() {
    return get('$api/orders').list.then((e) => e.mapList(Order.fromJson));
  }

  Future<List<Order>> ordersAvailable() {
    return get('$api/orders/available')
        .list
        .then((e) => e.mapList(Order.fromJson));
  }

  Future<Order> order(Identifier id) {
    return get('$api/orders/$id').map.then(Order.fromJson);
  }

  Future<Order> postOrder({
    required Identifier artifactId,
    required double price,
    required DateTime completionDate,
  }) {
    return post('$api/orders', {
      'artifactId': artifactId.toJson(),
      'price': price.toString(),
      'completionDate': dateTimeToJson(completionDate),
    }).map.then(Order.fromJson);
  }

  Future<void> acceptOrder(Identifier id) async {
    await post('$api/orders/accept/$id');
  }

  Future<void> declineOrder(Identifier id) async {
    await post('$api/orders/decline/$id');
  }

  Future<void> suggestOrder({
    required Identifier stalkerId,
    required Identifier orderId,
  }) async {
    await post('$api/orders/suggest/', {
      'stalkerId': stalkerId.toJson(),
      'orderId': orderId.toJson(),
    });
  }

  Future<void> createInformation({
    required String title,
    required String description,
    required String information,
    required double price,
  }) async {
    await post('$api/information/', {
      'title': title,
      'description': description,
      'information': information,
      'price': price,
    });
  }

  Future<void> byInformation({
    required Identifier id,
  }) async {
    await post('$api/information/buy/$id');
  }

  Future<List<Information>> informations() {
    return get('$api/information')
        .list
        .then((e) => e.mapList(Information.fromJson));
  }

  Future<List<Information>> informationsAvailable() {
    return get('$api/information/available')
        .list
        .then((e) => e.mapList(Information.fromJson));
  }

  Future<Information> information(Identifier id) {
    return get('$api/information/$id').map.then(Information.fromJson);
  }

  Future<List<User>> stalkers() {
    return get('$api/users/stalkers')
        .list
        .then((e) => e.mapList(User.fromJson));
  }

  Future<List<Notice>> notices() {
    return get('$api/notifications')
        .list
        .then((e) => e.mapList(Notice.fromJson));
  }
}

extension _Future on Future {
  Future<Map<String, dynamic>> get map =>
      then((value) => value as Map<String, dynamic>);
  Future<List<Map<String, dynamic>>> get list => then((value) => value as List)
      .then((value) => value.mapList((e) => e as Map<String, dynamic>));
}

String dateTimeToJson(DateTime dt) {
  return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}
