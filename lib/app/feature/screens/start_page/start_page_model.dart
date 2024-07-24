import 'package:flutter/material.dart';

class StartPageModel extends ChangeNotifier {}

class StartPageModelProvider extends InheritedNotifier {
  final StartPageModel model;

  // StartPageModelProvider({ //! todo чем отличается форма записи конструктора разобрать
  //   super.key, 
  //   super.notifier, 
  //   required super.child, 
  //   required this.model
  //   });

  const StartPageModelProvider({
  Key? key,
  required this.model,
  required Widget child,
}) : super(
  key: key,
  notifier: model,
  child: child,
);

  static StartPageModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StartPageModelProvider>();
  }

  static StartPageModelProvider? read(BuildContext context) {
    final widget = 
      context.getElementForInheritedWidgetOfExactType<StartPageModelProvider>()?.widget;
    return widget is StartPageModelProvider ? widget : null; // Эта строка кода в Dart проверяет, является ли объект widget экземпляром класса StartPageModelProvider. Если да, то возвращает widget, иначе возвращает null
  }

}

