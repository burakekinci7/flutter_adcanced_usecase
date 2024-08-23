import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/back_to_from/back_to_from_view.dart';

class BackToHomeView extends StatefulWidget {
  const BackToHomeView({super.key});

  @override
  State<BackToHomeView> createState() => _BackToHomeViewState();
}

class _BackToHomeViewState extends State<BackToHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingActionButton.extended(
          onPressed: () {
            context.toPush(const BackToFormView());
          },
          label: const Text('Navigate to form')),
    );
  }
}

extension ContextExtension on BuildContext {
  void toPush(Widget page) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => page,
        ));
  }

  void toPop() {
    Navigator.pop(this);
  }
}
