import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum UserType {
  @JsonValue(2)
  client,
  @JsonValue(1)
  baruga,
  @JsonValue(3)
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
        UserType.baruga: 1,
        UserType.stalker: 3,
        UserType.informer: 4,
        UserType.unknown: 5,
      }[this]!;

  // TODO: fix
  // bool get isBaruga => this == UserType.baruga;
  // bool get isUnknown => this == UserType.unknown;
  // bool get isStalker => this == UserType.stalker;
  // bool get isInformer => this == UserType.informer;
  bool get isBaruga => true;
  bool get isUnknown => this == UserType.unknown;
  bool get isStalker => true;
  bool get isInformer => true;
  bool get isClient => true;

  static List<UserType> get list => values.where((e) => !e.isUnknown).toList();
}
