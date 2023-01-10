import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'backname')
enum UserType {
  client('Client'),
  baruga('Huckster'),
  stalker('Stalker'),
  informer('Informer'),
  dealer('WeaponDealer'),
  courer('Courier'),
  unknown('');

  final String backname;

  const UserType(this.backname);

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
        return backname;
    }
  }

  String toJson() => backname;

  bool get isBaruga => this == UserType.baruga;
  bool get isUnknown => this == UserType.unknown;
  bool get isStalker => this == UserType.stalker;
  bool get isInformer => this == UserType.informer;
  bool get isClient => this == UserType.client;

  static List<UserType> get list => values.where((e) => !e.isUnknown).toList();
}
