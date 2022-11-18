import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:houston_app/feature/auth/screens/login_screen.dart';
import 'package:houston_app/feature/dashboard/screens/home_screen.dart';
import 'package:houston_app/feature/landing/screens/landing_screen.dart';
import 'package:houston_app/feature/dashboard/components/dashboard_container.dart';
import 'package:houston_app/feature/post/screens/post_edit_screen.dart';
import 'package:houston_app/feature/post/screens/post_detail_screen.dart';
import 'package:houston_app/feature/post/screens/post_list_screen.dart';
import 'package:houston_app/feature/style_guide/screens/style_guide_screen.dart';
import 'package:houston_app/feature/user/screens/authenticated_user_detail_screen.dart';

const List<AutoRoute> sharedRoutes = [
  AutoRoute(path: "style-guide", page: StyleGuideScreen),
  AutoRoute(path: "post/:uuid", page: PostDetailScreen),
];

const List<AutoRoute> appRoutes = [
  AutoRoute(initial: true, path: "/", page: LandingScreen),
  AutoRoute(path: "login", page: LoginScreen),
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
        AutoRoute(path: "", page: PostEditScreen),
        ...sharedRoutes,
      ],
    ),
    AutoRoute(
      path: 'me',
      name: "MeTabRouter",
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: "", page: AuthenticatedUserDetailScreen),
        ...sharedRoutes,
      ],
    ),
  ],
);

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route,Screen', routes: appRoutes)
class $AppRouter {}
