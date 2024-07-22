import 'package:auto_route/auto_route.dart';
import 'package:surf_flutter_summer_school_24/router/tape_routes.dart';

import '../features/features.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      initial: true,
      children: [
        TapeRoutes.routes
      ]
    )
  ];
}