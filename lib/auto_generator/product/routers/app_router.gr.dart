// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter_adcanced_usecase/auto_generator/home/bottom_navigation_bar.dart'
    as _i1;
import 'package:flutter_adcanced_usecase/auto_generator/home/home_details_view.dart'
    as _i2;
import 'package:flutter_adcanced_usecase/auto_generator/home/home_seconds_view.dart'
    as _i3;
import 'package:flutter_adcanced_usecase/auto_generator/home/home_view.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    BottomBarMainView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomBarMainView(),
      );
    },
    HomeDetailsView.name: (routeData) {
      final args = routeData.argsAs<HomeDetailsViewArgs>(
          orElse: () => const HomeDetailsViewArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HomeDetailsView(
          key: args.key,
          url: args.url,
        ),
      );
    },
    HomeSecondsView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeSecondsView(),
      );
    },
    HomeView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomBarMainView]
class BottomBarMainView extends _i5.PageRouteInfo<void> {
  const BottomBarMainView({List<_i5.PageRouteInfo>? children})
      : super(
          BottomBarMainView.name,
          initialChildren: children,
        );

  static const String name = 'BottomBarMainView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeDetailsView]
class HomeDetailsView extends _i5.PageRouteInfo<HomeDetailsViewArgs> {
  HomeDetailsView({
    _i6.Key? key,
    String? url,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          HomeDetailsView.name,
          args: HomeDetailsViewArgs(
            key: key,
            url: url,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeDetailsView';

  static const _i5.PageInfo<HomeDetailsViewArgs> page =
      _i5.PageInfo<HomeDetailsViewArgs>(name);
}

class HomeDetailsViewArgs {
  const HomeDetailsViewArgs({
    this.key,
    this.url,
  });

  final _i6.Key? key;

  final String? url;

  @override
  String toString() {
    return 'HomeDetailsViewArgs{key: $key, url: $url}';
  }
}

/// generated route for
/// [_i3.HomeSecondsView]
class HomeSecondsView extends _i5.PageRouteInfo<void> {
  const HomeSecondsView({List<_i5.PageRouteInfo>? children})
      : super(
          HomeSecondsView.name,
          initialChildren: children,
        );

  static const String name = 'HomeSecondsView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeView]
class HomeView extends _i5.PageRouteInfo<void> {
  const HomeView({List<_i5.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
