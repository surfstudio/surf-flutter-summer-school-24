import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/data/api/image_controller/image_controller_api_client.dart';
import 'package:surf_flutter_summer_school_24/domain/domain.dart';

part 'tape_event.dart';
part 'tape_state.dart';

class TapeBloc extends Bloc<TapeEvent, TapeState> {
  final ImageControllerApiClient imageControllerApiClient;

  TapeBloc({
    required this.imageControllerApiClient
  }) : super(TapeInitialState()) {
    on<TapeInit>(_onInit);
    on<UploadImageEvent>(_onUrlImageUpload);
    on<ItemsEvent>(_onItems);
  }

  Future<void> _onInit(
    TapeInit event,
    Emitter<TapeState> emit
  ) async {
    try {
      emit(TapeLoadingState());
      final uploadFile = await imageControllerApiClient.getUploadFile('event.path');
      final items = await imageControllerApiClient.getItems();
      emit(TapeLoadedState(
        urlToAddImage: uploadFile, 
        items: items
        )
      );
    } catch (e) {
      emit(TapeFailureState(e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onUrlImageUpload(
    UploadImageEvent event,
    Emitter<TapeState> emit,
  ) async {
    try {
      if (state is TapeLoadedState) {
        emit(TapeLoadingState());
      }
      final uploadFile = await imageControllerApiClient.getUploadFile('event.path');

      emit(TapeLoadedState(
        urlToAddImage: uploadFile, 
        items: (state as TapeLoadedState).items
        )
      );
    } catch (e) {
      emit(TapeFailureState(e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onItems(
    ItemsEvent event,
    Emitter<TapeState> emit
  ) async {
    try {
      emit(TapeLoadingState());
      final items = await imageControllerApiClient.getItems();
      emit(TapeLoadedState(
        urlToAddImage: (state as TapeLoadedState).urlToAddImage, 
        items: items
        )
      );
    } catch (e) {
      emit(TapeFailureState(e));
    } finally {
      event.completer?.complete();
    }
  }
}
