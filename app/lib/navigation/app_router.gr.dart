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
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:auto_route/empty_router_widgets.dart' as _i9;
import 'package:flutter/material.dart' as _i16;
import 'package:houston_app/access/auth/screens/login_screen.dart' as _i2;
import 'package:houston_app/access/me/screens/me_profile_detail_screen.dart'
    as _i14;
import 'package:houston_app/access/me/screens/me_profile_edit_screen.dart'
    as _i5;
import 'package:houston_app/content/post/screens/me_post_list_screen.dart'
    as _i12;
import 'package:houston_app/content/post/screens/post_comment_screen.dart'
    as _i8;
import 'package:houston_app/content/post/screens/post_detail_screen.dart'
    as _i7;
import 'package:houston_app/content/post/screens/post_edit_screen.dart' as _i13;
import 'package:houston_app/content/post/screens/post_list_screen.dart' as _i11;
import 'package:houston_app/core/theme/screens/style_guide_screen.dart' as _i6;
import 'package:houston_app/navigation/dashboard/components/dashboard_container.dart'
    as _i3;
import 'package:houston_app/navigation/dashboard/screens/home_screen.dart'
    as _i10;
import 'package:houston_app/navigation/landing/screens/landing_screen.dart'
    as _i1;
import 'package:houston_app/navigation/settings/screens/settings_screen.dart'
    as _i4;

class AppRouter extends _i15.RootStackRouter {
  AppRouter([_i16.GlobalKey<_i16.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    LandingScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    DashboardContainerRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashboardContainer(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsScreen(),
      );
    },
    MeProfileEditScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.MeProfileEditScreen(),
      );
    },
    StyleGuideScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.StyleGuideScreen(),
      );
    },
    PostDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostDetailScreenRouteArgs>(
          orElse: () =>
              PostDetailScreenRouteArgs(uuid: pathParams.getString('uuid')));
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.PostDetailScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    PostCommentsScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostCommentsScreenRouteArgs>(
          orElse: () => PostCommentsScreenRouteArgs(
              postUuid: pathParams.getString('uuid')));
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.PostCommentsScreen(
          key: args.key,
          postUuid: args.postUuid,
        ),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    PostTabRouter.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    MeTabRouter.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomeScreen(),
      );
    },
    PostListScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.PostListScreen(),
      );
    },
    MePostListScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.MePostListScreen(),
      );
    },
    PostEditScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.PostEditScreen(),
      );
    },
    MeProfileDetailScreenRoute.name: (routeData) {
      return _i15.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.MeProfileDetailScreen(),
      );
    },
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(
          LandingScreenRoute.name,
          path: '/',
        ),
        _i15.RouteConfig(
          LoginScreenRoute.name,
          path: 'login',
        ),
        _i15.RouteConfig(
          DashboardContainerRoute.name,
          path: '/app',
          children: [
            _i15.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardContainerRoute.name,
              redirectTo: '/home',
              fullMatch: true,
            ),
            _i15.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: DashboardContainerRoute.name,
              children: [
                _i15.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                ),
                _i15.RouteConfig(
                  SettingsScreenRoute.name,
                  path: 'settings',
                  parent: HomeTabRouter.name,
                ),
                _i15.RouteConfig(
                  MeProfileEditScreenRoute.name,
                  path: 'settings/profile',
                  parent: HomeTabRouter.name,
                ),
                _i15.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: HomeTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: HomeTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostCommentsScreenRoute.name,
                  path: 'post/:uuid/comments',
                  parent: HomeTabRouter.name,
                ),
              ],
            ),
            _i15.RouteConfig(
              PostTabRouter.name,
              path: 'posts',
              parent: DashboardContainerRoute.name,
              children: [
                _i15.RouteConfig(
                  PostListScreenRoute.name,
                  path: '',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  MePostListScreenRoute.name,
                  path: 'me/',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostEditScreenRoute.name,
                  path: 'edit/',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  SettingsScreenRoute.name,
                  path: 'settings',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  MeProfileEditScreenRoute.name,
                  path: 'settings/profile',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: PostTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostCommentsScreenRoute.name,
                  path: 'post/:uuid/comments',
                  parent: PostTabRouter.name,
                ),
              ],
            ),
            _i15.RouteConfig(
              MeTabRouter.name,
              path: 'me',
              parent: DashboardContainerRoute.name,
              children: [
                _i15.RouteConfig(
                  MeProfileDetailScreenRoute.name,
                  path: '',
                  parent: MeTabRouter.name,
                ),
                _i15.RouteConfig(
                  SettingsScreenRoute.name,
                  path: 'settings',
                  parent: MeTabRouter.name,
                ),
                _i15.RouteConfig(
                  MeProfileEditScreenRoute.name,
                  path: 'settings/profile',
                  parent: MeTabRouter.name,
                ),
                _i15.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: MeTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: MeTabRouter.name,
                ),
                _i15.RouteConfig(
                  PostCommentsScreenRoute.name,
                  path: 'post/:uuid/comments',
                  parent: MeTabRouter.name,
                ),
              ],
            ),
          ],
        ),
        _i15.RouteConfig(
          SettingsScreenRoute.name,
          path: 'settings',
        ),
        _i15.RouteConfig(
          MeProfileEditScreenRoute.name,
          path: 'settings/profile',
        ),
        _i15.RouteConfig(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        ),
        _i15.RouteConfig(
          PostDetailScreenRoute.name,
          path: 'post/:uuid',
        ),
        _i15.RouteConfig(
          PostCommentsScreenRoute.name,
          path: 'post/:uuid/comments',
        ),
        _i15.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingScreenRoute extends _i15.PageRouteInfo<void> {
  const LandingScreenRoute()
      : super(
          LandingScreenRoute.name,
          path: '/',
        );

  static const String name = 'LandingScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i15.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: 'login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.DashboardContainer]
class DashboardContainerRoute extends _i15.PageRouteInfo<void> {
  const DashboardContainerRoute({List<_i15.PageRouteInfo>? children})
      : super(
          DashboardContainerRoute.name,
          path: '/app',
          initialChildren: children,
        );

  static const String name = 'DashboardContainerRoute';
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsScreenRoute extends _i15.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i5.MeProfileEditScreen]
class MeProfileEditScreenRoute extends _i15.PageRouteInfo<void> {
  const MeProfileEditScreenRoute()
      : super(
          MeProfileEditScreenRoute.name,
          path: 'settings/profile',
        );

  static const String name = 'MeProfileEditScreenRoute';
}

/// generated route for
/// [_i6.StyleGuideScreen]
class StyleGuideScreenRoute extends _i15.PageRouteInfo<void> {
  const StyleGuideScreenRoute()
      : super(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        );

  static const String name = 'StyleGuideScreenRoute';
}

/// generated route for
/// [_i7.PostDetailScreen]
class PostDetailScreenRoute
    extends _i15.PageRouteInfo<PostDetailScreenRouteArgs> {
  PostDetailScreenRoute({
    _i16.Key? key,
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

  final _i16.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'PostDetailScreenRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i8.PostCommentsScreen]
class PostCommentsScreenRoute
    extends _i15.PageRouteInfo<PostCommentsScreenRouteArgs> {
  PostCommentsScreenRoute({
    _i16.Key? key,
    required String postUuid,
  }) : super(
          PostCommentsScreenRoute.name,
          path: 'post/:uuid/comments',
          args: PostCommentsScreenRouteArgs(
            key: key,
            postUuid: postUuid,
          ),
          rawPathParams: {'uuid': postUuid},
        );

  static const String name = 'PostCommentsScreenRoute';
}

class PostCommentsScreenRouteArgs {
  const PostCommentsScreenRouteArgs({
    this.key,
    required this.postUuid,
  });

  final _i16.Key? key;

  final String postUuid;

  @override
  String toString() {
    return 'PostCommentsScreenRouteArgs{key: $key, postUuid: $postUuid}';
  }
}

/// generated route for
/// [_i9.EmptyRouterPage]
class HomeTabRouter extends _i15.PageRouteInfo<void> {
  const HomeTabRouter({List<_i15.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class PostTabRouter extends _i15.PageRouteInfo<void> {
  const PostTabRouter({List<_i15.PageRouteInfo>? children})
      : super(
          PostTabRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'PostTabRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class MeTabRouter extends _i15.PageRouteInfo<void> {
  const MeTabRouter({List<_i15.PageRouteInfo>? children})
      : super(
          MeTabRouter.name,
          path: 'me',
          initialChildren: children,
        );

  static const String name = 'MeTabRouter';
}

/// generated route for
/// [_i10.HomeScreen]
class HomeScreenRoute extends _i15.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i11.PostListScreen]
class PostListScreenRoute extends _i15.PageRouteInfo<void> {
  const PostListScreenRoute()
      : super(
          PostListScreenRoute.name,
          path: '',
        );

  static const String name = 'PostListScreenRoute';
}

/// generated route for
/// [_i12.MePostListScreen]
class MePostListScreenRoute extends _i15.PageRouteInfo<void> {
  const MePostListScreenRoute()
      : super(
          MePostListScreenRoute.name,
          path: 'me/',
        );

  static const String name = 'MePostListScreenRoute';
}

/// generated route for
/// [_i13.PostEditScreen]
class PostEditScreenRoute extends _i15.PageRouteInfo<void> {
  const PostEditScreenRoute()
      : super(
          PostEditScreenRoute.name,
          path: 'edit/',
        );

  static const String name = 'PostEditScreenRoute';
}

/// generated route for
/// [_i14.MeProfileDetailScreen]
class MeProfileDetailScreenRoute extends _i15.PageRouteInfo<void> {
  const MeProfileDetailScreenRoute()
      : super(
          MeProfileDetailScreenRoute.name,
          path: '',
        );

  static const String name = 'MeProfileDetailScreenRoute';
}
