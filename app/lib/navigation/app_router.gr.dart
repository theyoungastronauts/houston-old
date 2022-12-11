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
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:auto_route/empty_router_widgets.dart' as _i12;
import 'package:flutter/material.dart' as _i19;
import 'package:houston_app/access/auth/screens/login_screen.dart' as _i2;
import 'package:houston_app/access/auth/screens/register_screen.dart' as _i3;
import 'package:houston_app/access/me/screens/me_profile_detail_screen.dart'
    as _i17;
import 'package:houston_app/access/me/screens/me_profile_edit_screen.dart'
    as _i6;
import 'package:houston_app/access/user/providers/user_list_provider.dart'
    as _i20;
import 'package:houston_app/access/user/screens/user_detail_screen.dart'
    as _i10;
import 'package:houston_app/access/user/screens/user_list_screen.dart' as _i11;
import 'package:houston_app/content/post/screens/me_post_list_screen.dart'
    as _i15;
import 'package:houston_app/content/post/screens/post_comment_screen.dart'
    as _i9;
import 'package:houston_app/content/post/screens/post_detail_screen.dart'
    as _i8;
import 'package:houston_app/content/post/screens/post_edit_screen.dart' as _i16;
import 'package:houston_app/content/post/screens/post_list_screen.dart' as _i14;
import 'package:houston_app/core/theme/screens/style_guide_screen.dart' as _i7;
import 'package:houston_app/navigation/dashboard/components/dashboard_container.dart'
    as _i4;
import 'package:houston_app/navigation/dashboard/screens/home_screen.dart'
    as _i13;
import 'package:houston_app/navigation/landing/screens/landing_screen.dart'
    as _i1;
import 'package:houston_app/navigation/settings/screens/settings_screen.dart'
    as _i5;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    LandingScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.LandingScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    RegisterScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegisterScreen(),
      );
    },
    DashboardContainerRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardContainer(),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsScreen(),
      );
    },
    MeProfileEditScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.MeProfileEditScreen(),
      );
    },
    StyleGuideScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.StyleGuideScreen(),
      );
    },
    PostDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PostDetailScreenRouteArgs>(
          orElse: () =>
              PostDetailScreenRouteArgs(uuid: pathParams.getString('uuid')));
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.PostDetailScreen(
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
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i9.PostCommentsScreen(
          key: args.key,
          postUuid: args.postUuid,
        ),
      );
    },
    UserDetailScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserDetailScreenRouteArgs>(
          orElse: () =>
              UserDetailScreenRouteArgs(uuid: pathParams.getString('uuid')));
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.UserDetailScreen(
          key: args.key,
          uuid: args.uuid,
        ),
      );
    },
    UserListScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserListScreenRouteArgs>();
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.UserListScreen(
          args.type,
          key: args.key,
        ),
      );
    },
    HomeTabRouter.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    PostTabRouter.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    MeTabRouter.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i12.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
      );
    },
    PostListScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.PostListScreen(),
      );
    },
    MePostListScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.MePostListScreen(),
      );
    },
    PostEditScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.PostEditScreen(),
      );
    },
    MeProfileDetailScreenRoute.name: (routeData) {
      return _i18.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.MeProfileDetailScreen(),
      );
    },
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(
          LandingScreenRoute.name,
          path: '/',
        ),
        _i18.RouteConfig(
          LoginScreenRoute.name,
          path: 'login',
        ),
        _i18.RouteConfig(
          RegisterScreenRoute.name,
          path: 'register',
        ),
        _i18.RouteConfig(
          DashboardContainerRoute.name,
          path: '/app',
          children: [
            _i18.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardContainerRoute.name,
              redirectTo: '/home',
              fullMatch: true,
            ),
            _i18.RouteConfig(
              HomeTabRouter.name,
              path: 'home',
              parent: DashboardContainerRoute.name,
              children: [
                _i18.RouteConfig(
                  HomeScreenRoute.name,
                  path: '',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  SettingsScreenRoute.name,
                  path: 'settings',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  MeProfileEditScreenRoute.name,
                  path: 'settings/profile',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostCommentsScreenRoute.name,
                  path: 'post/:uuid/comments',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  UserDetailScreenRoute.name,
                  path: 'user/:uuid',
                  parent: HomeTabRouter.name,
                ),
                _i18.RouteConfig(
                  UserListScreenRoute.name,
                  path: 'users/',
                  parent: HomeTabRouter.name,
                ),
              ],
            ),
            _i18.RouteConfig(
              PostTabRouter.name,
              path: 'posts',
              parent: DashboardContainerRoute.name,
              children: [
                _i18.RouteConfig(
                  PostListScreenRoute.name,
                  path: '',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  MePostListScreenRoute.name,
                  path: 'me/',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostEditScreenRoute.name,
                  path: 'edit/',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  SettingsScreenRoute.name,
                  path: 'settings',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  MeProfileEditScreenRoute.name,
                  path: 'settings/profile',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostCommentsScreenRoute.name,
                  path: 'post/:uuid/comments',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  UserDetailScreenRoute.name,
                  path: 'user/:uuid',
                  parent: PostTabRouter.name,
                ),
                _i18.RouteConfig(
                  UserListScreenRoute.name,
                  path: 'users/',
                  parent: PostTabRouter.name,
                ),
              ],
            ),
            _i18.RouteConfig(
              MeTabRouter.name,
              path: 'me',
              parent: DashboardContainerRoute.name,
              children: [
                _i18.RouteConfig(
                  MeProfileDetailScreenRoute.name,
                  path: '',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  SettingsScreenRoute.name,
                  path: 'settings',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  MeProfileEditScreenRoute.name,
                  path: 'settings/profile',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  StyleGuideScreenRoute.name,
                  path: 'style-guide',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostDetailScreenRoute.name,
                  path: 'post/:uuid',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  PostCommentsScreenRoute.name,
                  path: 'post/:uuid/comments',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  UserDetailScreenRoute.name,
                  path: 'user/:uuid',
                  parent: MeTabRouter.name,
                ),
                _i18.RouteConfig(
                  UserListScreenRoute.name,
                  path: 'users/',
                  parent: MeTabRouter.name,
                ),
              ],
            ),
          ],
        ),
        _i18.RouteConfig(
          SettingsScreenRoute.name,
          path: 'settings',
        ),
        _i18.RouteConfig(
          MeProfileEditScreenRoute.name,
          path: 'settings/profile',
        ),
        _i18.RouteConfig(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        ),
        _i18.RouteConfig(
          PostDetailScreenRoute.name,
          path: 'post/:uuid',
        ),
        _i18.RouteConfig(
          PostCommentsScreenRoute.name,
          path: 'post/:uuid/comments',
        ),
        _i18.RouteConfig(
          UserDetailScreenRoute.name,
          path: 'user/:uuid',
        ),
        _i18.RouteConfig(
          UserListScreenRoute.name,
          path: 'users/',
        ),
        _i18.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.LandingScreen]
class LandingScreenRoute extends _i18.PageRouteInfo<void> {
  const LandingScreenRoute()
      : super(
          LandingScreenRoute.name,
          path: '/',
        );

  static const String name = 'LandingScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i18.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: 'login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterScreenRoute extends _i18.PageRouteInfo<void> {
  const RegisterScreenRoute()
      : super(
          RegisterScreenRoute.name,
          path: 'register',
        );

  static const String name = 'RegisterScreenRoute';
}

/// generated route for
/// [_i4.DashboardContainer]
class DashboardContainerRoute extends _i18.PageRouteInfo<void> {
  const DashboardContainerRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DashboardContainerRoute.name,
          path: '/app',
          initialChildren: children,
        );

  static const String name = 'DashboardContainerRoute';
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsScreenRoute extends _i18.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i6.MeProfileEditScreen]
class MeProfileEditScreenRoute extends _i18.PageRouteInfo<void> {
  const MeProfileEditScreenRoute()
      : super(
          MeProfileEditScreenRoute.name,
          path: 'settings/profile',
        );

  static const String name = 'MeProfileEditScreenRoute';
}

/// generated route for
/// [_i7.StyleGuideScreen]
class StyleGuideScreenRoute extends _i18.PageRouteInfo<void> {
  const StyleGuideScreenRoute()
      : super(
          StyleGuideScreenRoute.name,
          path: 'style-guide',
        );

  static const String name = 'StyleGuideScreenRoute';
}

/// generated route for
/// [_i8.PostDetailScreen]
class PostDetailScreenRoute
    extends _i18.PageRouteInfo<PostDetailScreenRouteArgs> {
  PostDetailScreenRoute({
    _i19.Key? key,
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

  final _i19.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'PostDetailScreenRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i9.PostCommentsScreen]
class PostCommentsScreenRoute
    extends _i18.PageRouteInfo<PostCommentsScreenRouteArgs> {
  PostCommentsScreenRoute({
    _i19.Key? key,
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

  final _i19.Key? key;

  final String postUuid;

  @override
  String toString() {
    return 'PostCommentsScreenRouteArgs{key: $key, postUuid: $postUuid}';
  }
}

/// generated route for
/// [_i10.UserDetailScreen]
class UserDetailScreenRoute
    extends _i18.PageRouteInfo<UserDetailScreenRouteArgs> {
  UserDetailScreenRoute({
    _i19.Key? key,
    required String uuid,
  }) : super(
          UserDetailScreenRoute.name,
          path: 'user/:uuid',
          args: UserDetailScreenRouteArgs(
            key: key,
            uuid: uuid,
          ),
          rawPathParams: {'uuid': uuid},
        );

  static const String name = 'UserDetailScreenRoute';
}

class UserDetailScreenRouteArgs {
  const UserDetailScreenRouteArgs({
    this.key,
    required this.uuid,
  });

  final _i19.Key? key;

  final String uuid;

  @override
  String toString() {
    return 'UserDetailScreenRouteArgs{key: $key, uuid: $uuid}';
  }
}

/// generated route for
/// [_i11.UserListScreen]
class UserListScreenRoute extends _i18.PageRouteInfo<UserListScreenRouteArgs> {
  UserListScreenRoute({
    required _i20.UserListType type,
    _i19.Key? key,
  }) : super(
          UserListScreenRoute.name,
          path: 'users/',
          args: UserListScreenRouteArgs(
            type: type,
            key: key,
          ),
        );

  static const String name = 'UserListScreenRoute';
}

class UserListScreenRouteArgs {
  const UserListScreenRouteArgs({
    required this.type,
    this.key,
  });

  final _i20.UserListType type;

  final _i19.Key? key;

  @override
  String toString() {
    return 'UserListScreenRouteArgs{type: $type, key: $key}';
  }
}

/// generated route for
/// [_i12.EmptyRouterPage]
class HomeTabRouter extends _i18.PageRouteInfo<void> {
  const HomeTabRouter({List<_i18.PageRouteInfo>? children})
      : super(
          HomeTabRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class PostTabRouter extends _i18.PageRouteInfo<void> {
  const PostTabRouter({List<_i18.PageRouteInfo>? children})
      : super(
          PostTabRouter.name,
          path: 'posts',
          initialChildren: children,
        );

  static const String name = 'PostTabRouter';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class MeTabRouter extends _i18.PageRouteInfo<void> {
  const MeTabRouter({List<_i18.PageRouteInfo>? children})
      : super(
          MeTabRouter.name,
          path: 'me',
          initialChildren: children,
        );

  static const String name = 'MeTabRouter';
}

/// generated route for
/// [_i13.HomeScreen]
class HomeScreenRoute extends _i18.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i14.PostListScreen]
class PostListScreenRoute extends _i18.PageRouteInfo<void> {
  const PostListScreenRoute()
      : super(
          PostListScreenRoute.name,
          path: '',
        );

  static const String name = 'PostListScreenRoute';
}

/// generated route for
/// [_i15.MePostListScreen]
class MePostListScreenRoute extends _i18.PageRouteInfo<void> {
  const MePostListScreenRoute()
      : super(
          MePostListScreenRoute.name,
          path: 'me/',
        );

  static const String name = 'MePostListScreenRoute';
}

/// generated route for
/// [_i16.PostEditScreen]
class PostEditScreenRoute extends _i18.PageRouteInfo<void> {
  const PostEditScreenRoute()
      : super(
          PostEditScreenRoute.name,
          path: 'edit/',
        );

  static const String name = 'PostEditScreenRoute';
}

/// generated route for
/// [_i17.MeProfileDetailScreen]
class MeProfileDetailScreenRoute extends _i18.PageRouteInfo<void> {
  const MeProfileDetailScreenRoute()
      : super(
          MeProfileDetailScreenRoute.name,
          path: '',
        );

  static const String name = 'MeProfileDetailScreenRoute';
}
