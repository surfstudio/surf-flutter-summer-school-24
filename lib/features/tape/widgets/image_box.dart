import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({super.key});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  final List<String> images = [
    'https://i.pinimg.com/564x/40/e3/ed/40e3ed304ab2f8633aec33dc0460239c.jpg',
    'https://i.pinimg.com/236x/eb/61/9f/eb619f95f9f1bf1bfe25ccb97d1587ef.jpg',
    'https://i.pinimg.com/474x/fa/8a/ed/fa8aedb090206ac998db1118f52e72ab.jpg',
    'https://i.pinimg.com/236x/8b/7f/86/8b7f8661933f777677fa1fa9c6138624.jpg',
    'https://i.pinimg.com/236x/f9/6b/73/f96b735c8e0e1c8dfd0729120fc9bca9.jpg',
    'https://i.pinimg.com/236x/d7/eb/b3/d7ebb3254756d4f83b6282c7c3868fdb.jpg',
    'https://i.pinimg.com/564x/40/e3/ed/40e3ed304ab2f8633aec33dc0460239c.jpg',
    'https://i.pinimg.com/236x/eb/61/9f/eb619f95f9f1bf1bfe25ccb97d1587ef.jpg',
    'https://i.pinimg.com/474x/fa/8a/ed/fa8aedb090206ac998db1118f52e72ab.jpg',
    'https://i.pinimg.com/236x/8b/7f/86/8b7f8661933f777677fa1fa9c6138624.jpg',
    'https://i.pinimg.com/236x/f9/6b/73/f96b735c8e0e1c8dfd0729120fc9bca9.jpg',
    'https://i.pinimg.com/236x/d7/eb/b3/d7ebb3254756d4f83b6282c7c3868fdb.jpg',
    'https://i.pinimg.com/564x/40/e3/ed/40e3ed304ab2f8633aec33dc0460239c.jpg',
    'https://i.pinimg.com/236x/eb/61/9f/eb619f95f9f1bf1bfe25ccb97d1587ef.jpg',
    'https://i.pinimg.com/474x/fa/8a/ed/fa8aedb090206ac998db1118f52e72ab.jpg',
    'https://i.pinimg.com/236x/8b/7f/86/8b7f8661933f777677fa1fa9c6138624.jpg',
    'https://i.pinimg.com/236x/f9/6b/73/f96b735c8e0e1c8dfd0729120fc9bca9.jpg',
    'https://i.pinimg.com/236x/d7/eb/b3/d7ebb3254756d4f83b6282c7c3868fdb.jpg',
    'https://i.pinimg.com/564x/40/e3/ed/40e3ed304ab2f8633aec33dc0460239c.jpg',
    'https://i.pinimg.com/236x/eb/61/9f/eb619f95f9f1bf1bfe25ccb97d1587ef.jpg',
    'https://i.pinimg.com/474x/fa/8a/ed/fa8aedb090206ac998db1118f52e72ab.jpg',
    'https://i.pinimg.com/236x/8b/7f/86/8b7f8661933f777677fa1fa9c6138624.jpg',
    'https://i.pinimg.com/236x/f9/6b/73/f96b735c8e0e1c8dfd0729120fc9bca9.jpg',
    'https://i.pinimg.com/236x/d7/eb/b3/d7ebb3254756d4f83b6282c7c3868fdb.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.router.push(const ImageViewRoute());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: images.length,
        )
      );
  }
}
