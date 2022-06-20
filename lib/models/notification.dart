import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/identifier.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notification {
  final bool wasRead;
  final String text;
  final Identifier? orderId;

  Notification({
    required this.wasRead,
    required this.text,
    required this.orderId,
  });

  static Notification fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}
