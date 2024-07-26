import 'package:surf_flutter_summer_school_24/domain/model/image_model.dart';
import 'package:surf_flutter_summer_school_24/domain/repository/repository.dart';

class MockPhotoRepository implements IPhotoRepository {
  @override
  Future<List<ImageModel>> getPhotos() async {
    return const [
      ImageModel(
          href:
              'https://i.pinimg.com/564x/40/e3/ed/40e3ed304ab2f8633aec33dc0460239c.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/474x/fa/8a/ed/fa8aedb090206ac998db1118f52e72ab.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/8b/7f/86/8b7f8661933f777677fa1fa9c6138624.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/f9/6b/73/f96b735c8e0e1c8dfd0729120fc9bca9.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/d7/eb/b3/d7ebb3254756d4f83b6282c7c3868fdb.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/2d/16/2c/2d162c7e97143e38ac32e0587e92f09e.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/d8/f3/b6/d8f3b6dc196e0641fb1ca13626ec0fd2.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/11/0c/f5/110cf5084c0bb4e77b57c2642f88293c.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/28/6f/2d/286f2dadf59d6878fc9aa4c40356ce69.jpg'),
      ImageModel(
          href:
              'https://i.pinimg.com/236x/d8/72/1c/d8721c6eef9664afa8abb12b27fa7ebf.jpg'),
    ];
  }
}
