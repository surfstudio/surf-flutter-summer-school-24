import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends Equatable {
  const ItemModel(
      {required this.file,
      required this.path,
      required this.name,
      required this.created});

  final String file;
  final String path;
  final String name;
  final String created;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  List<Object> get props => [file, path, name, created];
}
