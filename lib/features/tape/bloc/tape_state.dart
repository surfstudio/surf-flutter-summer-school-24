part of 'tape_bloc.dart';

sealed class TapeState extends Equatable {
  const TapeState();

  @override
  List<Object> get props => [];
}

final class TapeInitialState extends TapeState {}

final class TapeLoadingState extends TapeState {}

final class TapeLoadedState extends TapeState {
  const TapeLoadedState({
    required this.urlToAddImage,
    required this.items
  });

  final ImageModel urlToAddImage;
  final ItemsModel items;

  @override
  List<Object> get props => super.props..addAll([urlToAddImage, items]);
}

final class TapeFailureState extends TapeState {
  const TapeFailureState(
    this.error
  );

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}