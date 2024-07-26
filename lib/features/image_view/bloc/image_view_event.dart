part of 'image_view_bloc.dart';

@immutable
sealed class ImageViewEvent extends Equatable{
  const ImageViewEvent();

  @override
  List<Object?> get props => [];
}

final class ImageViewItemsEvent extends ImageViewEvent {
  const ImageViewItemsEvent({
    this.completer
  });
  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}