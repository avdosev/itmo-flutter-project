class Identifier {
  final String value;

  Identifier.fromString(this.value);

  factory Identifier.fromJson(dynamic json) {
    return Identifier.fromString(json.toString());
  }

  dynamic toJson() => int.parse(value);

  @override
  String toString() => value;

  @override
  bool operator ==(Object obj) {
    return obj is Identifier && value == obj.value;
  }

  @override
  int get hashCode => value.hashCode;
}
