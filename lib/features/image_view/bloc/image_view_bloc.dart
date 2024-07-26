import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/data/api/image_controller/image_controller_api_client.dart';

import '../../../domain/domain.dart';

part 'image_view_event.dart';
part 'image_view_state.dart';

class ImageViewBloc extends Bloc<ImageViewEvent, ImageViewState> {
  final ImageControllerApiClient imageControllerApiClient;

  ImageViewBloc({required this.imageControllerApiClient})
      : super(ImageViewInitialState()) {
    on<ImageViewItemsEvent>(_onItems);
    on<ImageViewPageChangedEvent>(_onPageChanged);
  }

  Future<void> _onItems(
      ImageViewItemsEvent event, Emitter<ImageViewState> emit) async {
    try {
      emit(ImageViewLoadingState());
      final items = await imageControllerApiClient.getItems();
      emit(ImageViewLoadedState(items: items));
      log('ImageViewBloc log: $items');
    } catch (e) {
      emit(ImageViewFailureState(e));
      log('ImageViewBloc exception log: $e');
    } finally {
      event.completer?.complete();
    }
  }

  void _onPageChanged(ImageViewPageChangedEvent event, Emitter<ImageViewState> emit) {
    if (state is ImageViewLoadedState) {
      final loadedState = state as ImageViewLoadedState;
      emit(ImageViewLoadedState(items: loadedState.items, activePage: event.pageIndex));
    }
  }
}


