enum UserType {
  client,
  baruga,
  stalker,
  informer,
  unknown;

  // TODO: fix
  // bool get isBaruga => this == UserType.baruga;
  // bool get isUnknown => this == UserType.unknown;
  // bool get isStalker => this == UserType.stalker;
  // bool get isInformer => this == UserType.informer;
  bool get isBaruga => true;
  bool get isUnknown => true;
  bool get isStalker => true;
  bool get isInformer => true;
}
