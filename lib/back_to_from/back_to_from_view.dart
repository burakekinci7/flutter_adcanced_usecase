import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/back_to_from/back_to_form_mixin.dart';
import 'package:flutter_adcanced_usecase/back_to_from/back_to_form_state.dart';
import 'package:flutter_adcanced_usecase/componets/alert_dialog_custom.dart';
import 'package:flutter_adcanced_usecase/custom_form_field/check_box_form_filed.dart';

class BackToFormView extends StatefulWidget {
  const BackToFormView({super.key});

  @override
  State<BackToFormView> createState() => _BackToFormViewState();
}

class _BackToFormViewState extends State<BackToFormView> with BackToFormMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: _submitButton(),
      body: ValueListenableBuilder<BackToFormState>(
          valueListenable: satateFormNotifier,
          builder: (context, value, child) {
            return Form(
              key: formkey,
              canPop: value.isFormEmpty,
              onChanged: onFromChangeListen,
              onPopInvoked: onPopInvoked,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameControllor,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                  ),
                  CheckBoxFormField(
                    title: 'User Agreement',
                    onChanged: updateUserAgreemant,
                  ),
                ],
              ),
            );
          }),
    );
  }

  Padding _submitButton() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: FloatingActionButton.extended(
          onPressed: () {
            AlertDialogCustom.show(
              context: context,
              title: 'title',
              content: 'sdfsdf sd fsdf sdf sdfs fs fs dfsd fs fs sds fs dfsd fsd fsd fsd sdf',
              firstText: 'firstText',
              secondText: 'secondText',
              firstOnPressed: () {},
              secondOnPressed: () {},
            );
          },
          label: const Text('Complated')),
    );
  }
}
