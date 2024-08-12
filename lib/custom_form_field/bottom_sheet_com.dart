import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  static Future show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => const CustomBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Please icon button ondistain' * 30),
        IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: const Icon(Icons.check_outlined))
      ],
    );
  }
}
