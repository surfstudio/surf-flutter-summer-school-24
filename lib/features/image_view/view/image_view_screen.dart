import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
            BlocBuilder<ImageViewBloc, ImageViewState>(
              builder: (context, state) {
                if (state is ImageViewLoadedState) {
                  final items = state.items.items;
                  final currentImage = items.isNotEmpty ? items[state.activePage] : null;
                  return SliverAppBar(
                    pinned: true,
                    expandedHeight: 50,
                    surfaceTintColor: Colors.transparent,
                    centerTitle: true,
                    title: Text(
                      _dateProcessing(currentImage?.created ?? ''),
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    actions: [
                      imageViewAction((state.activePage + 1).toString(), items.length.toString()),
                    ],
                  );
                }
                return const SliverAppBar();
              },
            ),
            const SliverToBoxAdapter(
              child: ScrollImage(),
            ),
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
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          '/$allImages',
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 22),
      ],
    );
  }

  String _dateProcessing(String date) {
    final DateFormat formatter = DateFormat('yyyy.MM.dd');
    final formattedDate = DateTime.parse(date);
    return formatter.format(formattedDate).toString();
  }

  Future<void> _refreshScreen(BuildContext context) async {
    final imageViewBloc = BlocProvider.of<ImageViewBloc>(context);
    final completer = Completer<void>();
    imageViewBloc.add(ImageViewItemsEvent(completer: completer));
    await completer.future;
  }
}