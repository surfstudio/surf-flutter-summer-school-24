// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ImageViewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImageViewScreen(),
      );
    },
    TapeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TapeScreen(),
      );
    },
    TapeWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TapeWrapperScreen()),
      );
    },
  };
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImageViewScreen]
class ImageViewRoute extends PageRouteInfo<void> {
  const ImageViewRoute({List<PageRouteInfo>? children})
      : super(
          ImageViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImageViewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TapeScreen]
class TapeRoute extends PageRouteInfo<void> {
  const TapeRoute({List<PageRouteInfo>? children})
      : super(
          TapeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TapeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TapeWrapperScreen]
class TapeWrapperRoute extends PageRouteInfo<void> {
  const TapeWrapperRoute({List<PageRouteInfo>? children})
      : super(
          TapeWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TapeWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
