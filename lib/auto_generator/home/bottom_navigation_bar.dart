import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/auto_generator/product/routers/app_router.gr.dart';

@RoutePage()
class BottomBarMainView extends StatelessWidget {
  const BottomBarMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes:  const [
        HomeView(),
        HomeSecondsView(),
      ],
      builder: (context, child) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: "SearchSeconds"),
            ],
          ),
        );
      },
    );
  }
}
