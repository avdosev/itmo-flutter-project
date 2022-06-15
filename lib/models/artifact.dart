import 'package:json_annotation/json_annotation.dart';
import 'package:mpi_front/models/identifier.dart';

part 'artifact.g.dart';

@JsonSerializable()
class Artifact {
  final Identifier id;
  final String? url;
  final String name;
  final double? price;

  Artifact({
    this.url,
    required this.name,
    required this.id,
    this.price,
  });

  static Artifact fromJson(Map<String, dynamic> json) =>
      _$ArtifactFromJson(json);
  Map<String, dynamic> toJson() =>
      _$ArtifactToJson(this);
}
