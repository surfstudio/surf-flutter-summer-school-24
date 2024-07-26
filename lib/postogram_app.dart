import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/data/api/api.dart';
import 'package:surf_flutter_summer_school_24/features/features.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';
import 'package:surf_flutter_summer_school_24/uikit/uikit.dart';

class PostogramApp extends StatefulWidget {
  const PostogramApp({required this.themeController, super.key});

  final ThemeController themeController;

  @override
  State<PostogramApp> createState() => _PostogramAppState();
}

class _PostogramAppState extends State<PostogramApp> {
  final _router = AppRouter();
  final imageControllerApiClient =
      ImageControllerApiClient.create(apiUrl: dotenv.env['BASE_URL']);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ImageViewBloc(
                  imageControllerApiClient: imageControllerApiClient)),
          BlocProvider(
            create: (context) =>
                TapeBloc(imageControllerApiClient: imageControllerApiClient),
          )
        ],
        child: ThemeInherited(
          themeController: widget.themeController,
          child: ThemeBuilder(
            builder: (_, themeMode) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppThemeData.lightThem,
                darkTheme: AppThemeData.darkTheme,
                themeMode: themeMode,
                routerConfig: _router.config(),
              );
            },
          ),
        ));
  }
}
