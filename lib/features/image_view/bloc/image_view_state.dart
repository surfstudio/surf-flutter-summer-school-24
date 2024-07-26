part of 'image_view_bloc.dart';

sealed class ImageViewState extends Equatable {
  const ImageViewState();

  @override
  List<Object> get props => [];
}

final class ImageViewInitialState extends ImageViewState {}

final class ImageViewLoadingState extends ImageViewState {}

// final class ImageViewLoadedState extends ImageViewState {
//   const ImageViewLoadedState({
//     required this.image
//   });

//   final ImageModel image;

//   @override
//   List<Object> get props => super.props..add(image);
// }

final class ImageViewLoadedState extends ImageViewState {
  const ImageViewLoadedState({
    required this.items
  });

  final ItemsModel items;

  @override
  List<Object> get props => super.props..add(items);
}

final class ImageViewFailureState extends ImageViewState {
  const ImageViewFailureState(
    this.error
  );

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}