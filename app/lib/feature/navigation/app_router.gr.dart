// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i5;
import 'package:flutter/material.dart' as _i8;
import 'package:houston_app/feature/auth/screens/login_screen.dart' as _i2;
import 'package:houston_app/feature/dashboard/components/dashboard_container.dart'
    as _i3;
import 'package:houston_app/feature/dashboard/screens/home_screen.dart' as _i6;
import 'package:houston_app/feature/landing/screens/landing_screen.dart' as _i1;
import 'package:houston_app/feature/style_guide/screens/style_guide_screen.dart'
    as _i4;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    LandingScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    DashboardContainerRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardContainer(),
      );
    },
    StyleGuideScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.StyleGuideScreen(),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          LandingScreenRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginScreenRoute.name,
          path: 'login',
        ),
        _i7.RouteConfig(
          DashboardContainerRoute.name,
          path: '/app',
          children: [
            _i7.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardContainerRoute.name,
              redirectTo: '/home',
              fullMatch: true,
            ),
            _i7.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: DashboardContainerRoute.name,
              children: [
                _i7.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                ),
                _i7.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: HomeTabRouter.name,
                ),
              ],
            ),
          ],
        ),
        _i7.RouteConfig(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        ),
        _i7.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingScreenRoute extends _i7.PageRouteInfo<void> {
  const LandingScreenRoute()
      : super(
          LandingScreenRoute.name,
          path: '/',
        );

  static const String name = 'LandingScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: 'login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.DashboardContainer]
class DashboardContainerRoute extends _i7.PageRouteInfo<void> {
  const DashboardContainerRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardContainerRoute.name,
          path: '/app',
          initialChildren: children,
        );

  static const String name = 'DashboardContainerRoute';
}

/// generated route for
/// [_i4.StyleGuideScreen]
class StyleGuideScreenRoute extends _i7.PageRouteInfo<void> {
  const StyleGuideScreenRoute()
      : super(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        );

  static const String name = 'StyleGuideScreenRoute';
}

/// generated route for
/// [_i5.EmptyRouterPage]
class HomeTabRouter extends _i7.PageRouteInfo<void> {
  const HomeTabRouter({List<_i7.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}
