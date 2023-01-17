import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:itertools/itertools.dart';
import 'package:mpi_front/api/auth_service.dart';
import 'package:mpi_front/models/models.dart';
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:mpi_front/utils/buit.dart';

class Network {
  static Network get I => Network();

  final host = 'http://127.0.0.1:8080';
  String get api => '$host/api';

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

  Future<dynamic> put(String url, [Map<String, dynamic>? json]) async {
    print(AuthService.I.token);
    final resp = await http.put(
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
      'role': role.toJson(),
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

  Future<User> updateProfile({
    required String? firstName,
    required String? lastName,
    required String? middleName,
    required String? nickname,
  }) {
    return put('$api/users/current', {
      "firstName": firstName,
      "lastName": lastName,
      "middleName": middleName,
      "nickname": nickname,
    }).map.then((value) => value['user']).map.then(User.fromJson);
  }

  Future<User> currentUser() {
    return get('$api/users/current')
        .map
        .then((value) => value['user'])
        .map
        .then(User.fromJson);
  }

  Future<void> uploadAvatar(Uint8List image, String filename) async {
    print(image.length);
    final uri = Uri.parse('$api/users/image/upload');
    final request = http.MultipartRequest('POST', uri);
    final httpImage = http.MultipartFile.fromBytes(
      'image',
      image,
      filename: filename,
      contentType: MediaType.parse('image/png'),
    );
    request.files.add(httpImage);
    request.headers
      ..addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${AuthService.I.token!}',
      });
    final response = await request.send();
    print('upload avatar');
    print(await response.stream.bytesToString());
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
    required String location,
  }) {
    return post('$api/orders', {
      'artifactId': artifactId.toJson(),
      'price': price.toString(),
      'completionDate': dateTimeToJson(completionDate),
      'deliveryAddress': location,
    }).map.then(Order.fromJson);
  }

  Future<void> acceptOrder(Identifier id) async {
    await post('$api/orders/accept/$id');
  }

  Future<void> declineOrder(Identifier id) async {
    await post('$api/orders/decline/$id');
  }

  Future<void> completeOrder(Identifier id) async {
    await post('$api/orders/complete/$id');
  }

  Future<void> deliverOrder(Identifier id) async {
    await post('$api/orders/deliver/$id');
  }

  /// Предложить заказ сталкеру/курьеру
  Future<void> suggestOrder({
    required Identifier userId,
    required Identifier orderId,
  }) async {
    await post('$api/orders/suggest/', {
      'userId': userId.toJson(),
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

  Future<void> buyInformation({
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

  Future<List<User>> couriers() {
    return get('$api/users/couriers')
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

extension UserX on User {
  String? get avatarUrl =>
      imagePath?.pipe((path) => '${Network.I.host}/images/users/$path');
}
