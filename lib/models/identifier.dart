class Identifier {
  final String value;

  Identifier.fromString(this.value);

  factory Identifier.fromJson(dynamic json) {
    return Identifier.fromString(json.toString());
  }

  dynamic toJson() => int.parse(value);
}
