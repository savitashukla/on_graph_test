part of 'auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
AutoRoute(page:HomePageFRoute.page,path: "/"),
  ];
}
