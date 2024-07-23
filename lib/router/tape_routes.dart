import 'package:auto_route/auto_route.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

class TapeRoutes {
  static final routes = AutoRoute(page: TapeWrapperRoute.page, children: [
    AutoRoute(page: TapeRoute.page, initial: true),
    AutoRoute(page: ImageViewRoute.page)
  ]);
}
