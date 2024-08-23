import 'package:flutter/cupertino.dart';

class CustomCupertinoSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color trackColor;

  const CustomCupertinoSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.trackColor = CupertinoColors.inactiveGray,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: value,
      onChanged: onChanged,
      trackColor: trackColor,
      //thumbColor: CupertinoColors.black,
    );
  }
}
