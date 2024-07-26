import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends Equatable {
  const ImageModel({
    required this.href,
  });

  final String href;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);

  @override
  List<Object> get props => [href];
}
