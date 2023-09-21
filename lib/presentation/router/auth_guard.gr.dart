
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:on_graph_test_demo/presentation/ui/view/current_location_w.dart'
    as _i1;
import 'package:on_graph_test_demo/presentation/ui/view/home_page_first.dart'
    as _i2;
import 'package:on_graph_test_demo/presentation/ui/view/home_page_second.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CurrentLocationWRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CurrentLocationW(),
      );
    },
    HomePageFRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePageF(),
      );
    },
    HomePageSecRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePageSec(),
      );
    },
  };
}

/// generated route for
/// [_i1.CurrentLocationW]
class CurrentLocationWRoute extends _i4.PageRouteInfo<void> {
  const CurrentLocationWRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CurrentLocationWRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrentLocationWRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePageF]
class HomePageFRoute extends _i4.PageRouteInfo<void> {
  const HomePageFRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomePageFRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageFRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePageSec]
class HomePageSecRoute extends _i4.PageRouteInfo<void> {
  const HomePageSecRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomePageSecRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageSecRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
