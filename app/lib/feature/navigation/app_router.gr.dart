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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i12;
import 'package:houston_app/feature/auth/screens/login_screen.dart' as _i2;
import 'package:houston_app/feature/dashboard/components/dashboard_container.dart' as _i3;
import 'package:houston_app/feature/dashboard/screens/home_screen.dart' as _i7;
import 'package:houston_app/feature/landing/screens/landing_screen.dart' as _i1;
import 'package:houston_app/feature/post/screens/post_edit_screen.dart' as _i9;
import 'package:houston_app/feature/post/screens/post_detail_screen.dart' as _i5;
import 'package:houston_app/feature/post/screens/post_list_screen.dart' as _i8;
import 'package:houston_app/feature/style_guide/screens/style_guide_screen.dart' as _i4;
import 'package:houston_app/feature/user/screens/authenticated_user_detail_screen.dart' as _i10;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LandingScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    DashboardContainerRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardContainer(),
      );
    },
    StyleGuideScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.StyleGuideScreen(),
      );
    },
    PostDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostDetailScreenRouteArgs>(orElse: () => PostDetailScreenRouteArgs(uuid: pathParams.getString('uuid')));
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.PostDetailScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    PostTabRouter.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    MeTabRouter.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    PostListScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.PostListScreen(),
      );
    },
    PostCreateScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.PostEditScreen(),
      );
    },
    AuthenticatedUserDetailScreenRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.AuthenticatedUserDetailScreen(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          LandingScreenRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          LoginScreenRoute.name,
          path: 'login',
        ),
        _i11.RouteConfig(
          DashboardContainerRoute.name,
          path: '/app',
          children: [
            _i11.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardContainerRoute.name,
              redirectTo: '/home',
              fullMatch: true,
            ),
            _i11.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: DashboardContainerRoute.name,
              children: [
                _i11.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                ),
                _i11.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: HomeTabRouter.name,
                ),
                _i11.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: HomeTabRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              PostTabRouter.name,
              path: 'posts',
              parent: DashboardContainerRoute.name,
              children: [
                _i11.RouteConfig(
                  PostListScreenRoute.name,
                  path: '',
                  parent: PostTabRouter.name,
                ),
                _i11.RouteConfig(
                  PostCreateScreenRoute.name,
                  path: '',
                  parent: PostTabRouter.name,
                ),
                _i11.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: PostTabRouter.name,
                ),
                _i11.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: PostTabRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              MeTabRouter.name,
              path: 'me',
              parent: DashboardContainerRoute.name,
              children: [
                _i11.RouteConfig(
                  AuthenticatedUserDetailScreenRoute.name,
                  path: '',
                  parent: MeTabRouter.name,
                ),
                _i11.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: MeTabRouter.name,
                ),
                _i11.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: MeTabRouter.name,
                ),
              ],
            ),
          ],
        ),
        _i11.RouteConfig(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        ),
        _i11.RouteConfig(
          PostDetailScreenRoute.name,
          path: 'post/:uuid',
        ),
        _i11.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingScreenRoute extends _i11.PageRouteInfo<void> {
  const LandingScreenRoute()
      : super(
          LandingScreenRoute.name,
          path: '/',
        );

  static const String name = 'LandingScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i11.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: 'login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.DashboardContainer]
class DashboardContainerRoute extends _i11.PageRouteInfo<void> {
  const DashboardContainerRoute({List<_i11.PageRouteInfo>? children})
      : super(
          DashboardContainerRoute.name,
          path: '/app',
          initialChildren: children,
        );

  static const String name = 'DashboardContainerRoute';
}

/// generated route for
/// [_i4.StyleGuideScreen]
class StyleGuideScreenRoute extends _i11.PageRouteInfo<void> {
  const StyleGuideScreenRoute()
      : super(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        );

  static const String name = 'StyleGuideScreenRoute';
}

/// generated route for
/// [_i5.PostDetailScreen]
class PostDetailScreenRoute extends _i11.PageRouteInfo<PostDetailScreenRouteArgs> {
  PostDetailScreenRoute({
    _i12.Key? key,
    required String uuid,
  }) : super(
          PostDetailScreenRoute.name,
          path: 'post/:uuid',
          args: PostDetailScreenRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
        );

  static const String name = 'PostDetailScreenRoute';
}

class PostDetailScreenRouteArgs {
  const PostDetailScreenRouteArgs({
    this.key,
    required this.uuid,
  });

  final _i12.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'PostDetailScreenRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomeTabRouter extends _i11.PageRouteInfo<void> {
  const HomeTabRouter({List<_i11.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class PostTabRouter extends _i11.PageRouteInfo<void> {
  const PostTabRouter({List<_i11.PageRouteInfo>? children})
      : super(
          PostTabRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'PostTabRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class MeTabRouter extends _i11.PageRouteInfo<void> {
  const MeTabRouter({List<_i11.PageRouteInfo>? children})
      : super(
          MeTabRouter.name,
          path: 'me',
          initialChildren: children,
        );

  static const String name = 'MeTabRouter';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeScreenRoute extends _i11.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i8.PostListScreen]
class PostListScreenRoute extends _i11.PageRouteInfo<void> {
  const PostListScreenRoute()
      : super(
          PostListScreenRoute.name,
          path: '',
        );

  static const String name = 'PostListScreenRoute';
}

/// generated route for
/// [_i9.PostEditScreen]
class PostCreateScreenRoute extends _i11.PageRouteInfo<void> {
  const PostCreateScreenRoute()
      : super(
          PostCreateScreenRoute.name,
          path: '',
        );

  static const String name = 'PostCreateScreenRoute';
}

/// generated route for
/// [_i10.AuthenticatedUserDetailScreen]
class AuthenticatedUserDetailScreenRoute extends _i11.PageRouteInfo<void> {
  const AuthenticatedUserDetailScreenRoute()
      : super(
          AuthenticatedUserDetailScreenRoute.name,
          path: '',
        );

  static const String name = 'AuthenticatedUserDetailScreenRoute';
}
