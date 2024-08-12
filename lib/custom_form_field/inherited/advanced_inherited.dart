import 'package:flutter/material.dart';

class AdvencedInherited extends InheritedWidget {
  const AdvencedInherited({
    required super.child,
    required this.data,
    super.key,
  });
  final AdvancedInheritedProviderState data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static AdvancedInheritedProviderState of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AdvencedInherited>();
    if (result == null) throw Exception('Eroorr:');
    return result.data;
  }
}

class AdvancedInheritedProvider extends StatefulWidget {
  const AdvancedInheritedProvider({super.key});

  @override
  State<AdvancedInheritedProvider> createState() =>
      AdvancedInheritedProviderState();
}

class AdvancedInheritedProviderState extends State<AdvancedInheritedProvider> {
  @override
  Widget build(BuildContext context) {
    return AdvencedInherited(
      data: this,
      child: const Text(''),
    );
  }
}
