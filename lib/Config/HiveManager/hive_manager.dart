import 'package:hive/hive.dart';

class HiveManager {
  static const String _boxName = 'cacheBox';
  static late final Box<dynamic> _cacheBox;

  HiveManager._internal(); // Private constructor

  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  static Future<void> init() async {
    _cacheBox = await Hive.openBox<dynamic>(_boxName);
  }

  static dynamic get(String key) {
    return _cacheBox.get(key);
  }

  static Future<void> put(String key, dynamic value) async {
    print(value);
    await _cacheBox.put(key, value).then((e) {
      print('Saved: $value'); // Print confirmation
    });
  }

  static Future<void> delete(String key) async {
    await _cacheBox.delete(key);
  }

  static Future<void> clear() async {
    await _cacheBox.clear();
  }
}
