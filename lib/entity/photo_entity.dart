final class PhotoEntity {
  final String id;
  final String url;
  final DateTime? createdAt;

  PhotoEntity({required this.id, required this.url, this.createdAt});
}
