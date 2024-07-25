import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/widgets/appbars/main_app_bar.dart';
import '/screens/photo_carousel_screen.dart';

class PhotoGridScreen extends StatelessWidget {
  final List<String> imageList;

  const PhotoGridScreen({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    List<CachedNetworkImageProvider> cachedImages =
        imageList.map((url) => CachedNetworkImageProvider(url)).toList();

    return Scaffold(
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: imageList.length,
          cacheExtent: 500,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PhotoCarouselScreen(
                      imageProviders: cachedImages,
                      initialIndex: index,
                    ),
                  ),
                );
              },
              child: KeepAliveWrapper(
                child: ShimmerLoadingImage(imageUrl: imageList[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ShimmerLoadingImage extends StatelessWidget {
  final String imageUrl;

  const ShimmerLoadingImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) =>
            Image(image: imageProvider, fit: BoxFit.cover),
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[300]!
              : Colors.grey[700]!,
          highlightColor: Theme.of(context).brightness == Brightness.light
              ? Colors.grey[100]!
              : Colors.grey[600]!,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({super.key, required this.child});

  @override
  _KeepAliveWrapperState createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
