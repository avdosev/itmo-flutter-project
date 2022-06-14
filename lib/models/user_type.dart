enum UserType {
  client(0, 'клиент'),
  baruga(1, 'барыга'),
  stalker(2, 'сталкер'),
  informer(3, 'информатор'),
  unknown(4, 'хуйня какая-то');

  final int roleId;
  final String runame;

  const UserType(this.roleId, this.runame);

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
