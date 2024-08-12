import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassword;
  final Icon prefixIcon;
  final String hintText;
  final String title;

  const MyTextField({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    required this.prefixIcon,
    required this.title,
    this.hintText = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        hintText: hintText,
        prefixIcon: prefixIcon,
        counter: const Text('end'),
        //filled: true,
        //fillColor:   Colors.amber,
        focusColor: Colors.amber,
        helperText: 'Helper',
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: _customBorder(Colors.blue),
        focusedBorder: _customBorder(Colors.green),
        errorBorder: _customBorder(Colors.red),
        border: _customBorder(Colors.red),
        focusedErrorBorder: _customBorder(Colors.red),
        errorStyle: const TextStyle(color: Colors.red),
      ),
      validator: _validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      obscuringCharacter: '*',
    );
  }

  String? _validator(String? value) {
    if (keyboardType == TextInputType.emailAddress) {
      return EmailValidator(value: value).validate;
    } else if (isPassword) {
      return PasswordVaidation(value: value).validate;
    }
    return TextVaidation(value: value).validate;
  }

  OutlineInputBorder _customBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}

final class EmailValidator extends Validator {
  EmailValidator({required super.value});

  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Please enter some text';
    }
    if (!_emailValidateFunc(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  bool _emailValidateFunc(String email) {
    String emailPattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // basit bir email doğrulama regex'i
    RegExp regExp = RegExp(emailPattern);
    return regExp.hasMatch(email);
  }
}

final class TextVaidation extends Validator {
  TextVaidation({required super.value});

  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Please enter some Password';
    }
    return null;
  }
}

final class PasswordVaidation extends Validator {
  PasswordVaidation({required super.value});

  @override
  String? get validate {
    if (value == null || value!.isEmpty) {
      return 'Please enter some text';
    }
    if (value!.length < 6) {
      return 'Password must be at lasted 6 characters long';
    }
    return null;
  }
}

abstract class Validator {
  Validator({required this.value});

  String? get validate;
  final String? value;
}
