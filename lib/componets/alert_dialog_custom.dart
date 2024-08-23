import 'package:flutter/material.dart';

class AlertDialogCustom extends StatelessWidget {
  const AlertDialogCustom(
      {super.key,
      required this.title,
      required this.content,
      this.barrierDismissible = true,
      required this.firstText,
      required this.secondText,
      required this.firstOnPressed,
      required this.secondOnPressed,
      this.color = Colors.cyan});
  final String title;
  final String content;
  final bool barrierDismissible;
  final String firstText;
  final String secondText;
  final void Function()? firstOnPressed;
  final void Function()? secondOnPressed;
  final Color color;

  /// Alert Dialog is Show
  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String content,
    bool barrierDismissible = true,
    required String firstText,
    required String secondText,
    required void Function()? firstOnPressed,
    required void Function()? secondOnPressed,
  }) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialogCustom(
        title: title,
        content: content,
        firstText: firstText,
        secondText: secondText,
        firstOnPressed: firstOnPressed,
        secondOnPressed: secondOnPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: firstOnPressed,
            child: Text(
              firstText,
              style: const TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: secondOnPressed,
            child: Text(
              secondText,
              style: const TextStyle(color: Colors.blue),
            )),
      ],
      scrollable: true,
      clipBehavior: Clip.antiAlias,
      actionsAlignment: MainAxisAlignment.spaceAround,
      actionsOverflowAlignment: OverflowBarAlignment.end,
      actionsOverflowDirection: VerticalDirection.up,
      actionsOverflowButtonSpacing: 0,
      backgroundColor: Colors.white,
      elevation: 10,
      alignment: Alignment.center, // dialog psition
      semanticLabel: 'Naber',
      shadowColor: color,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      surfaceTintColor: color.withOpacity(0.1), // face color tone
      //shape type:
      //1- CircleBorder
      //2- RoundedRectangleBorder
      //3- StarBorder
      //4- StadiumBorder
      //5- OvalBorder
      
    );
  }
}
