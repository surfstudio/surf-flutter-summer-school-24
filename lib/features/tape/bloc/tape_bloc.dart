import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_summer_school_24/data/api/image_controller/image_controller_api_client.dart';
import 'package:surf_flutter_summer_school_24/domain/domain.dart';

part 'tape_event.dart';
part 'tape_state.dart';

class TapeBloc extends Bloc<TapeEvent, TapeState> {
  final ImageControllerApiClient imageControllerApiClient;

  TapeBloc({required this.imageControllerApiClient})
      : super(TapeInitialState()) {
    on<TapeInit>(_onInit);
    on<UploadImageEvent>(_onUrlImageUpload);
    on<ItemsEvent>(_onItems);
  }

  Future<void> _onInit(TapeInit event, Emitter<TapeState> emit) async {
    try {
      emit(TapeLoadingState());

      final uploadFile = await imageControllerApiClient.getUploadFile('name');
      final items = await imageControllerApiClient.getItems();
      emit(TapeLoadedState(
          urlToAddImage: uploadFile,
          items: items,
      ));
    } catch (e) {
      emit(TapeFailureState(e));
    } finally {
      event.completer?.complete();
    }
  }

  Future<void> _onUrlImageUpload(UploadImageEvent event, Emitter<TapeState> emit) async {
  try {
    emit(TapeLoadingState());

    // Используем имя файла из события
    final upload = await imageControllerApiClient.getUploadFile(event.fileName);
    final dio = Dio();
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(event.path, filename: event.fileName),
    });
    await dio.put(upload.href, data: formData);
    final items = await imageControllerApiClient.getItems();

    emit(TapeLoadedState(
        urlToAddImage: upload,
        items: items,
    ));
  } catch (e) {
    emit(TapeFailureState(e));
  } finally {
    event.completer?.complete();
  }
}


  Future<void> _onItems(ItemsEvent event, Emitter<TapeState> emit) async {
    try {
      emit(TapeLoadingState());

      final items = await imageControllerApiClient.getItems();
      emit(TapeLoadedState(
          urlToAddImage: (state as TapeLoadedState).urlToAddImage,
          items: items,
      ));
    } catch (e) {
      emit(TapeFailureState(e));
    } finally {
      event.completer?.complete();
    }
  }
}
