import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  const ImageModel({required this.id, required this.url, this.createdAt
      //required this.courses
      });

  final int id;
  final String url;
  final DateTime? createdAt;
  //final Courses courses;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  List<Object> get props => [id, url, createdAt.toString()];
}
