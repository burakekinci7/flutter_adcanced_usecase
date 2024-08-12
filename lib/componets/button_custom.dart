import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color shadowColor;
  final Function() onPressed;

  const MyButton({
    super.key,
    required this.shadowColor,
    required this.title,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const int maxLength = 20;
    const int maxLines = 1;
    const double elevation = 1;
    const double verticalPadding = 12;
    const double withOpacity = 0.9;
    const String maxLenghtFeedBack = 'Çok uzun';

    return ElevatedButton(
      onPressed: onPressed,
      style: _buttonStyle(elevation, verticalPadding, withOpacity),
      child: Center(
          child: Text(
        title.getFormattedText(maxLenghtFeedBack, maxLength),
        style: _textStyle(),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      )),
    );
  }

  TextStyle _textStyle() =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.normal);

  ButtonStyle _buttonStyle(
      double elevation, double verticalPadding, double withOpacity) {
    return ButtonStyle(
      shadowColor: MaterialStatePropertyAll(shadowColor),
      elevation: MaterialStatePropertyAll(elevation),
      //overlayColor: const MaterialStatePropertyAll(Colors.grey),
      padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: verticalPadding)),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return backgroundColor.withOpacity(withOpacity);
        }
        return backgroundColor;
      }),
    );
  }
}

extension StringExtension on String {
  String getFormattedText(String maxLenghtFeedBack, int maxLength) {
    return length < maxLength ? this : maxLenghtFeedBack;
  }
}
