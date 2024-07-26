import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/features/features.dart';
import 'package:surf_flutter_summer_school_24/features/image_view/widgets/scroll_Image.dart';

@RoutePage()
class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ImageViewBloc>(context).add(const ImageViewItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.background,
        onRefresh: () async {
          await _refreshScreen(context);
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 50,
              surfaceTintColor: Colors.transparent,
              centerTitle: true,
              title: const Text(
                '21.05.2023',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300),
              ),
              actions: [imageViewAction('1', '13')],
            ),
            const SliverToBoxAdapter(
              child: ScrollImage(),
            )
          ],
        ),
      ),
    );
  }

  Row imageViewAction(String imageIndex, String allImages) {
    return Row(
      children: [
        Text(
          imageIndex,
          style: const TextStyle(
              fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w300),
        ),
        Text(
          '/$allImages',
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(width: 22)
      ],
    );
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final imageViewBloc = BlocProvider.of<ImageViewBloc>(context);
    final completer = Completer<void>();
    imageViewBloc.add(ImageViewItemsEvent(completer: completer));
    await completer.future;
  }
}