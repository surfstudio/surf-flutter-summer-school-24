import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    // final dynamicAppBarColorForTextSpan = Theme.of(context).appBarTheme.foregroundColor;
    return Scaffold(
      appBar: AppBar(
      // clipBehavior: Clip.none,
      leading: null,
      title: Center(
        child: Image.asset('assets/images/lologram.png')
        ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.abc_outlined))
      ],
      ),
      body: FloatingActionButton(
        onPressed: () { Navigator.of(context).pushNamed('/opened_image'); },
        child: Text('Перейти на фотографию')
      ),
    );
  }
}