import 'package:flutter_adcanced_usecase/hive_cus/cache/cache_manager.dart';
import 'package:flutter_adcanced_usecase/hive_cus/cache/cache_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// The HiveCacheManager class in an impentation of the CacheManager
final class HiveCacheManager extends CacheManager {
  /// Path to the directory
  HiveCacheManager({required super.path});

  @override
  Future<void> init({required List<CacheModel> items}) async {
    final documentPath = path ?? (await getApplicationCacheDirectory()).path;
    Hive.defaultDirectory = documentPath;

    for (var item in items) {
      Hive.registerAdapter(
          '${item.runtimeType}', (json) => item.fromDynamicJson(json));
    }
  }

  @override
  void remove() {
    Hive.deleteAllBoxesFromDisk();
  }
}
