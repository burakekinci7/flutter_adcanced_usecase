import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_adcanced_usecase/back_to_from/back_to_form_state.dart';
import 'package:flutter_adcanced_usecase/back_to_from/back_to_from_view.dart';
import 'package:flutter_adcanced_usecase/back_to_from/exit_alert_dialog.dart';

mixin BackToFormMixin on State<BackToFormView> {
  /// MARK: Form Key
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  /// MARK: Controllers
  final nameControllor = TextEditingController();
  final emailcontroller = TextEditingController();

  /// Mark: Values
  bool _isUserAgreemant = false;

  /// MARK: notifier
  final satateFormNotifier =
      ValueNotifier<BackToFormState>(const BackToFormState());

  /// MARK: Getters

  /// Is from Empty getters
  bool get isFormEmpty =>
      nameControllor.text.isEmpty &&
      emailcontroller.text.isEmpty &&
      !_isUserAgreemant;

  /// Form state Value
  BackToFormState get _formStateValue => satateFormNotifier.value;

  /// MARK: Methods
  void onFromChangeListen() {
    satateFormNotifier.value = _formStateValue.copyWith(
        isFormEmpty: isFormEmpty,
        isFormValid: formkey.currentState?.validate() ?? false);
  }

  /// MARK: check box value update
  void updateUserAgreemant( bool value) {
    _isUserAgreemant = value;
    onFromChangeListen();
  }

  /// From Checking the status of the pop
  void onPopInvoked(bool didPop) async {
    if (didPop) return;
    final responce = await ExitAlertDialog.show(context);
    
    if (responce == null || !responce) return;
    if (!mounted) return;
    Navigator.pop(context);
  }

  /// Name Validator
  String? nameValidatoe(String? value) {
    if (value?.isEmpty ?? false || value == null) {
      return 'Please enter ome text';
    }
    return null;
  }

  /// Email Validator
  String? emailValidatoe(String? value) {
    if (value?.isEmpty ?? false || value == null) {
      return 'Please enter ome text';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    nameControllor.dispose();
    emailcontroller.dispose();
  }
}
