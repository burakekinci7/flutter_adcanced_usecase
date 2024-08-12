import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/componets/button_custom.dart';
import 'package:flutter_adcanced_usecase/componets/text_field_custom.dart';

class CompTrialPage extends StatefulWidget {
  const CompTrialPage({super.key});

  @override
  State<CompTrialPage> createState() => _CompTrialPageState();
}

class _CompTrialPageState extends State<CompTrialPage> {
  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyButton(
              title: 'Simpl',
              backgroundColor: Colors.black,
              onPressed: () {},
              shadowColor: Colors.orange,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: _key,
                child: Column(
                  children: [
                    MyTextField(
                      title: 'Email',
                      controller: textEditingController,
                      keyboardType: TextInputType.multiline,
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
