import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum UserType {
  @JsonValue(2)
  client,
  @JsonValue(3)
  baruga,
  @JsonValue(1)
  stalker,
  @JsonValue(4)
  informer,
  @JsonValue(5)
  unknown;

  String get runame {
    switch (this) {
      case client:
        return 'клиент';
      case baruga:
        return 'барыга';
      case stalker:
        return 'сталкер';
      case informer:
        return 'информатор';
      case unknown:
      default:
        return 'хуйня какая-то';
    }
  }

  int get id => const {
        UserType.client: 2,
        UserType.baruga: 3,
        UserType.stalker: 1,
        UserType.informer: 4,
        UserType.unknown: 5,
      }[this]!;

  bool get isBaruga => this == UserType.baruga;
  bool get isUnknown => this == UserType.unknown;
  bool get isStalker => this == UserType.stalker;
  bool get isInformer => this == UserType.informer;
  bool get isClient => this == UserType.client;

  static List<UserType> get list => values.where((e) => !e.isUnknown).toList();
}
