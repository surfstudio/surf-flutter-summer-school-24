// ! БЕСПОЛЕЗНЫЙ ФАЙЛ

import 'package:flutter/material.dart';

class PhotoPageModel extends ChangeNotifier {
  late PageController controller;
  int currentIndex = 0;
  

}

class PhotoPageModelProvider extends InheritedNotifier {
  final PhotoPageModel model;

  // PhotoPageModelProvider({ //! todo чем отличается форма записи конструктора разобрать
  //   super.key, 
  //   super.notifier, 
  //   required super.child, 
  //   required this.model
  //   });

  const PhotoPageModelProvider({
  Key? key,
  required this.model,
  required Widget child,
}) : super(
  key: key,
  notifier: model,
  child: child,
);

  static PhotoPageModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PhotoPageModelProvider>();
  }

  static PhotoPageModelProvider? read(BuildContext context) {
    final widget = 
      context.getElementForInheritedWidgetOfExactType<PhotoPageModelProvider>()?.widget;
    return widget is PhotoPageModelProvider ? widget : null; // Эта строка кода в Dart проверяет, является ли объект widget экземпляром класса StartPageModelProvider. Если да, то возвращает widget, иначе возвращает null
  }

}

