import 'package:flutter_adcanced_usecase/hive_cus/cache/cache_model.dart';
import 'package:flutter_adcanced_usecase/hive_cus/cache/cache_operations.dart';
import 'package:hive/hive.dart';

final class HiveCacheOperations<T extends CacheModel>
    extends CacheOperations<T> {
  HiveCacheOperations() {
    _box = Hive.box<T>(name: T.toString());
  }

  late final Box<T> _box;

  @override
  void add(T item) {
    _box.put(item.id, item);
  }

  @override
  void addAll(List<T> items) {
    _box.putAll(Map.fromIterable(items));
  }

  @override
  void clear() {
    _box.clear();
  }

  @override
  T? get(String id) {
    return _box.get(id);
  }

  @override
  List<T> gettAll() {
    return _box
        .getAll(_box.keys)
        .where((element) => element != null)
        .cast<T>()
        .toList();
  }

  @override
  void remove(String id) {
    _box.delete(id);
  }
}
