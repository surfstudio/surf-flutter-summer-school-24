import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/ui/ui_kit/widget/custom_app_bar.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const Text('Упс!'),
          const Text('Произошла ошибка.'),
          const Text('Попробуйте снова.'),
          ElevatedButton(
              onPressed: () {}, child: const Text("ПОПРОБОВАТЬ СНОВА"))
        ],
      ),
    );
  }
}
