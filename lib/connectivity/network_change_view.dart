import 'package:flutter/material.dart';

class NetworkChangeView extends StatefulWidget {
  const NetworkChangeView({super.key});

  @override
  State<NetworkChangeView> createState() => _NetworkChangeViewState();
}

class _NetworkChangeViewState extends State<NetworkChangeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Placeholder(),
      bottomNavigationBar: const _BottomNavBarCustom(),
    );
  }
}

class _BottomNavBarCustom extends StatelessWidget {
  const _BottomNavBarCustom();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.one_k), label: 'Page One'),
      BottomNavigationBarItem(
          icon: Icon(Icons.two_k_outlined), label: 'Page Two'),
    ]);
  }
}
