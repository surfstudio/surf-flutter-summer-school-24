import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("05.06.2023"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
              child: const Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: '13',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                        text: '/37',)
                        //style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ))
        ],
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Image.asset(
                  "assets/images/Mahou_Shoujo_Madoka_Magika.jpg",
                  scale: 0.5,
                ))),
      ),
    );
  }
}
