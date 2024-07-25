import 'package:equatable/equatable.dart';

final class PhotoEntity extends Equatable{
  final int id;
  final String url;
  final DateTime? createdAt;

  const PhotoEntity({required this.id, required this.url, this.createdAt});

  @override
  List<Object?> get props => [ // props — это геттер, который возвращает список свойств объекта, которые должны использоваться для сравнения. 
    id,
    url,
    createdAt,
  ];
}


abstract interface class IPhotoRepository {
  Future<List<PhotoEntity>> getPhotos();
}

