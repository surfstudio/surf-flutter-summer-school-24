part of 'tape_bloc.dart';

@immutable
sealed class TapeEvent extends Equatable {
  const TapeEvent();

  @override
  List<Object?> get props => [];
}

final class UploadImageEvent extends TapeEvent {
  const UploadImageEvent({required this.path, required this.fileName, this.completer});
  
  final String path;
  final String fileName;
  final Completer? completer;

  @override
  List<Object?> get props => [path, fileName, completer];
}


final class ItemsEvent extends TapeEvent {
  const ItemsEvent({this.completer});

  final Completer? completer;

  @override
  List<Object?> get props => super.props..add(completer);
}

class TapeInit extends TapeEvent {
  const TapeInit({required this.path, this.completer});

  final Completer<void>? completer;
  final String path;
}
