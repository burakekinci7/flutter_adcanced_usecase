import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/connectivity/network_widget.dart';

class MainBuild {
  MainBuild._();

  /// wrap home 
  static Widget networkBuild(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(child: child ?? const SizedBox()),
        const NetworkWidget(),
      ],
    );
  }
}
