import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  final String id;
  final String url;

  Photo({required this.id, required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  String? get imagePath => null;
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
