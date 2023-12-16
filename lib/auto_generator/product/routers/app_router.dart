import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        //initial -> starter screen
        //path -> add to page path
        AutoRoute(page: BottomBarMainView.page, initial: true, children: [
          AutoRoute(page: HomeView.page),
          AutoRoute(page: HomeSecondsView.page),
        ]),
        AutoRoute(page: HomeDetailsView.page),
      ];
}
