import 'package:flutter_adcanced_usecase/hive_cus/hive/hive_cache_manager.dart';
import 'package:flutter_adcanced_usecase/hive_cus/hive/hive_cache_operations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'hive_common.dart';
import 'user_cache.dart';

void main() {
  setUp(() async {
    await initTests();
    final coreManager = HiveCacheManager(path: 'test/hive_test/hive');
    await coreManager.init(items: [
      UserCache.empty(),
    ]);
  });

  test('Add a data for database', () {
    final cacheOperations = HiveCacheOperations<UserCache>();
    cacheOperations.add(UserCache(id: '1', name: 'rbe'));
    final item = cacheOperations.get('1');
    expect(item, isNotNull);
  });
}
