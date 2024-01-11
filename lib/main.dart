import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/auto_generator/product/routers/app_router.dart';
import 'package:flutter_adcanced_usecase/connectivity/core/main/main_build.dart';
import 'package:flutter_adcanced_usecase/connectivity/network_change_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Use Case',
      home: NetworkChangeView(),
      builder: MainBuild.networkBuild,
    );
  }
}



/* 
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //router initialize
    final AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      title: 'Flutter Use Case',
      routerConfig: appRouter.config(),
    );
  }
}
 */

