import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/back_to_from/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Componnetes',
      home: BackToHomeView(),
    );
  }
}

/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Use Case',
      home: HiveUserSaveView(),
      builder: MainBuild.networkBuild,
    );
  }
}
 */


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

