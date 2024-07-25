import 'package:json_annotation/json_annotation.dart';
part 'json_photo_serializable.g.dart';


@JsonSerializable()
class ResponseList {
  final List<ResponseElements> items;

  ResponseList({required this.items});

  factory ResponseList.fromJson(Map<String, dynamic> json) => _$ResponseListFromJson(json);

  // Map<String, dynamic> toJson() => _$ResponseListFromJson(this); // ! ошибка типов?????????

}



@JsonSerializable()
class ResponseElements {
  // final String resource_id;
  // // final String? public_url;
  // final String path;
  // final String? date_time;
  final List<dynamic>? items;

  ResponseElements({
    // required this.resource_id, 
    // // required this.public_url,
    // required this.path,
    // required this.date_time,
    required this.items,
    });


  factory ResponseElements.fromJson(Map<String, dynamic> json) => _$ResponseElementsFromJson(json);


  Map<String, dynamic> toJson() => _$ResponseElementsToJson(this);
  
}

