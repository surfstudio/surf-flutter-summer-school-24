import 'dart:async';

import 'package:postogram/entity/photo_entity.dart';
import 'package:postogram/repository/i_repository.dart';

final class PhotoRepository implements IRepository<PhotoEntity> {
  @override
  Future<List<PhotoEntity>> getAll() async {
    return [
      PhotoEntity(
          id: '1',
          url: 'https://s1.1zoom.ru/big3/399/339975-svetik.jpg',
          createdAt: null),
      PhotoEntity(
          id: '2',
          url:
              'https://wallbox.ru/wallpapers/main/201136/ozero-gory-oblaka-1050618.jpg',
          createdAt: DateTime(2024, 7, 24)),
      PhotoEntity(
          id: '3',
          url:
              'https://img2.akspic.ru/attachments/originals/1/3/2/8/88231-otrazhenie-liniya_gorizonta-gorod-vodnyj_put-gorodskoj_pejzazh-2560x1600.jpg',
          createdAt: DateTime(2023, 5, 7)),
    ];
  }
}
