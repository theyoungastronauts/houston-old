import 'package:auto_route/auto_route.dart';
import 'components/base_component.dart';
import 'components/centered_loader.dart';
import 'providers/session_provider.dart';
import 'theme/providers/theme_provider.dart';
import 'theme/theme.dart';
import '../navigation/app_router.gr.dart';
import 'providers/global_loading_provider.dart';
import 'utils/singletons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<State<BottomNavigationBar>> bottomNavigationBar = GlobalKey<State<BottomNavigationBar>>();
GlobalKey<NavigatorState> rootNavigatorKey = singleton<AppRouter>().navigatorKey;
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends BaseComponent {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = singleton<AppRouter>();

    ref.read(sessionProvider);

    return MaterialApp.router(
      title: 'Houston',
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: AppTheme.light().themeData,
      darkTheme: AppTheme.dark().themeData,
      themeMode: ref.watch(themeProvider),
      routeInformationParser: appRouter.defaultRouteParser(includePrefixMatches: true),
      routerDelegate: AutoRouterDelegate(
        appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      builder: (context, widget) {
        return Consumer(builder: (context, ref, child) {
          if (!ref.watch(sessionProvider).ready) {
            return const CenteredLoader();
          }
          return Stack(
            children: [
              if (ref.watch(globalLoadingProvider))
                Container(
                  color: Colors.black54,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              widget!,
            ],
          );
        });
      },
    );
  }
}
