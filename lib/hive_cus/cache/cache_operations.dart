import 'package:flutter_adcanced_usecase/hive_cus/cache/cache_model.dart';

abstract class CacheOperations<T extends CacheModel> {
  void add(T item);
  void addAll(List<T> items);
  void remove(String id);
  void clear();
  List<T> gettAll();
  T? get(String id);
}
