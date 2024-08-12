import 'package:flutter_adcanced_usecase/hive_cus/cache/cache_model.dart';

/// The Cache Manager is the an abstrac class
abstract class CacheManager {
  CacheManager({required this.path});

  ///Make your initialize here
  Future<void> init({required List<CacheModel> items});

  /// Remove all cache
  void remove();

  ///[path] is the path to directory for example testing
  final String? path;
}
