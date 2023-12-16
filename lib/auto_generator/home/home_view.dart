import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/auto_generator/product/routers/app_router.gr.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _url = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IconButton(
        icon: Image.network(_url),
        onPressed: () {
          AutoRouter.of(context).push(HomeDetailsView(url: _url));
          //context.router.push(HomeDetailsView(url: _url));
        },
      ),
    );
  }
}

//dart run build_runner build --delete-conflicting-outputs