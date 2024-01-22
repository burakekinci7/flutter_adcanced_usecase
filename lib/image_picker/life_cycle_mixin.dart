import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

mixin LifeCycleMixin<T extends StatefulWidget>
    on WidgetsBindingObserver, State<T> {
  void onResume();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(LifecycleEventHandler(
      resumeCallBack: () async {
        onResume();
      },
      suspandingCallBack: () async {},
    ));
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler(
      {required this.resumeCallBack, required this.suspandingCallBack});
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspandingCallBack;

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumeCallBack();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        await suspandingCallBack();
        break;
    }
  }
}
