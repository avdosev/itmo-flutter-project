import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/identifier.dart';

part 'notification.g.dart';

@JsonSerializable()
class Notice {
  final bool wasRead;
  final String text;
  final Identifier? orderId;

  Notice({
    required this.wasRead,
    required this.text,
    required this.orderId,
  });

  static Notice fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
  Map<String, dynamic> toJson() => _$NoticeToJson(this);
}
