import 'package:equatable/equatable.dart';

final class PhotoEntity extends Equatable {
  final String id;
  final String url;
  final DateTime? createAt;

  const PhotoEntity({
    required this.id,
    required this.url,
    this.createAt,
  });

  @override
  List<Object?> get props => [
    id,
    url,
    createAt,
  ];
}