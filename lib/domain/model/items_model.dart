import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:surf_flutter_summer_school_24/domain/domain.dart';

part 'items_model.g.dart';

@JsonSerializable()
class ItemsModel extends Equatable {
  const ItemsModel({required this.items});

  final List<ItemModel> items;

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);

  @override
  List<Object> get props => [items];
}
