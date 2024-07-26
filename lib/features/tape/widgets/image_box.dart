import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/features/tape/bloc/tape_bloc.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({super.key});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TapeBloc, TapeState>(
      builder: (context, state) {
        if (state is TapeLoadingState) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        } else if (state is TapeLoadedState) {
          final items = state.items.items;
          return SliverPadding(
            padding: const EdgeInsets.all(2),
            sliver: SliverGrid(
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
                      borderRadius: BorderRadius.circular(8),
                      child: FadeInImage.assetNetwork(
                        placeholder: './assets/images/placeholder.png', 
                        image: items[index].file,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 300),
                        fadeOutDuration: const Duration(milliseconds: 300),
                      ),
                    ),
                  );
                },
                childCount: items.length,
              ),
            ),
          );
        } else if (state is TapeFailureState) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('Failed to load images'),
            ),
          );
        } else {
          return const SliverFillRemaining(
            child: SizedBox.shrink(),
          );
        }
      },
    );
  }
}
