import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/custom_form_field/custom_form_view.dart';

mixin CustomFormFieldMixin on State<CustomFormFieldView> {
  /// Form key using form validate
  final GlobalKey<FormState> customFormKey = GlobalKey<FormState>();

  /// Form validate notifier
  final ValueNotifier<bool> formValueNotifier = ValueNotifier<bool>(false);

  ///Form change notifier to validate the form
  void onFormChange() {
    formValueNotifier.value = customFormKey.currentState?.validate() ?? false;
  }
  
}
