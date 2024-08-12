import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/custom_form_field/custom_form_mixin.dart';
import 'package:flutter_adcanced_usecase/custom_form_field/custom_validator.dart';

class CustomFormFieldView extends StatefulWidget {
  const CustomFormFieldView({super.key});

  @override
  State<CustomFormFieldView> createState() => _CustomFormFieldViewState();
}

class _CustomFormFieldViewState extends State<CustomFormFieldView>
    with CustomFormFieldMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom text field'),
      ),
      body: Form(
        key: customFormKey,
        onChanged: onFormChange,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'First name',
              ),
              validator: (value) => CustomValidator(value: value).emptyCheck,
            ),
            _SubmitButton(formValueNotifier: formValueNotifier)
          ],
        ),
      ),
    );
  }
}

final class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.formValueNotifier,
  });

  final ValueNotifier<bool> formValueNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: formValueNotifier,
      builder: (context, value, child) {
        return ElevatedButton(
          onPressed: value
              ? null
              : () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('data')),
                  );
                },
          child: child,
        );
      },
    );
  }
}
