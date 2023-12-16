import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeSecondsView extends StatelessWidget {
  const HomeSecondsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Column(
          children: [Text("Home Seconds View",style: TextStyle(fontSize: 50),)],
        ));
  }
}
