import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/buttons.dart';
import 'package:houston_app/core/components/centered_loader.dart';
import 'package:houston_app/core/providers/global_loading_provider.dart';
import 'package:houston_app/feature/auth/components/auth_dropdown.dart';
import 'package:houston_app/feature/navigation/app_router.gr.dart';
import 'package:houston_app/feature/theme/theme.dart';

class DashboardContainer extends BaseComponent {
  const DashboardContainer({Key? key}) : super(key: key);

  static const List<PageRouteInfo> routes = [
    HomeTabRouter(),
    PostTabRouter(),
    MeTabRouter(),
  ];

  void onPressed(TabsRouter tabsRouter, index) {
    if (index == tabsRouter.activeIndex) {
      tabsRouter.stackRouterOfIndex(tabsRouter.activeIndex)!.popUntilRoot();
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: routes,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            onPressed(tabsRouter, index);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Posts",
              icon: Icon(Icons.article),
            ),
          ],
        );
      },
      builder: (context, child, animated) {
        return _RouteContainer(child: child);
      },
    );
  }

  @override
  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: routes,
      appBarBuilder: (_, tabsRouter) {
        return PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            height: 48,
            width: double.infinity,
            color: Colors.black38,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppButton(
                          label: "Home",
                          type: AppButtonType.Text,
                          variant: tabsRouter.activeIndex == 0 ? AppColorVariant.primary : AppColorVariant.light,
                          onPressed: () {
                            onPressed(tabsRouter, 0);
                          },
                        ),
                        AppButton(
                          label: "Posts",
                          type: AppButtonType.Text,
                          variant: tabsRouter.activeIndex == 1 ? AppColorVariant.primary : AppColorVariant.light,
                          onPressed: () {
                            onPressed(tabsRouter, 1);
                          },
                        ),
                      ],
                    ),
                    AuthDropdown(onProfilePressed: () {
                      onPressed(tabsRouter, 2);
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      builder: (context, child, animated) {
        return Column(
          children: [
            Expanded(child: _RouteContainer(child: child)),
          ],
        );
      },
    );
  }
}

class _RouteContainer extends BaseComponent {
  final Widget child;
  const _RouteContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        child,
        if (ref.watch(globalLoadingProvider))
          Container(
            color: Colors.black12,
            child: const CenteredLoader(),
          )
      ],
    );
  }
}
