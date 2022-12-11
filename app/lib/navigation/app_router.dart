import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../access/auth/screens/login_screen.dart';
import '../access/auth/screens/register_screen.dart';
import '../access/me/screens/me_profile_detail_screen.dart';
import '../access/me/screens/me_profile_edit_screen.dart';
import '../access/user/screens/user_detail_screen.dart';
import '../access/user/screens/user_list_screen.dart';
import '../content/post/screens/me_post_list_screen.dart';
import '../content/post/screens/post_comment_screen.dart';
import '../content/post/screens/post_detail_screen.dart';
import '../content/post/screens/post_edit_screen.dart';
import '../content/post/screens/post_list_screen.dart';
import '../core/theme/screens/style_guide_screen.dart';
import 'dashboard/components/dashboard_container.dart';
import 'dashboard/screens/home_screen.dart';
import 'landing/screens/landing_screen.dart';
import 'settings/screens/settings_screen.dart';

const List<AutoRoute> sharedRoutes = [
  AutoRoute(path: "settings", page: SettingsScreen),
  AutoRoute(path: "settings/profile", page: MeProfileEditScreen),
  AutoRoute(path: "style-guide", page: StyleGuideScreen),
  AutoRoute(path: "post/:uuid", page: PostDetailScreen),
  AutoRoute(path: "post/:uuid/comments", page: PostCommentsScreen),
  AutoRoute(path: "user/:uuid", page: UserDetailScreen),
  AutoRoute(path: "users/", page: UserListScreen)
];

const List<AutoRoute> appRoutes = [
  AutoRoute(initial: true, path: "/", page: LandingScreen),
  AutoRoute(path: "login", page: LoginScreen),
  AutoRoute(path: "register", page: RegisterScreen),
  dashboardRouter,
  ...sharedRoutes,
  RedirectRoute(path: '*', redirectTo: '/'),
];

const dashboardRouter = AutoRoute(
  path: "/app",
  page: DashboardContainer,
  children: [
    RedirectRoute(path: "", redirectTo: "/home"),
    AutoRoute(
      path: 'home',
      name: "HomeTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: HomeScreen),
        ...sharedRoutes,
      ],
    ),
    AutoRoute(
      path: 'posts',
      name: "PostTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: PostListScreen),
        AutoRoute(path: "me/", page: MePostListScreen),
        AutoRoute(path: "edit/", page: PostEditScreen),
        ...sharedRoutes,
      ],
    ),
    AutoRoute(
      path: 'me',
      name: "MeTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: MeProfileDetailScreen),
        ...sharedRoutes,
      ],
    ),
  ],
);

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}
