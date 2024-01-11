import 'package:flutter/material.dart';
import 'package:flutter_adcanced_usecase/connectivity/network_chanage_manager.dart';

class NetworkWidget extends StatefulWidget {
  const NetworkWidget({super.key});

  @override
  State<NetworkWidget> createState() => _NetworkWidgetState();
}

class _NetworkWidgetState extends State<NetworkWidget> with NetworkStateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    //fetchFirstResult();
    waitForScreen(() {
      _networkChange.handleNetworkChange((result) {
        _updateView(result);
      });
    });
  }

  Future<void> fetchFirstResult() async {
    waitForScreen(() async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Container(
          height: 50,
          color: Colors.red,
        ),
        secondChild: const SizedBox(),
        crossFadeState: _networkResult == NetworkResult.off
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(seconds: 1));
  }
}

mixin NetworkStateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplate) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplate.call();
    });
  }
}
