import 'package:get_storage/get_storage.dart';

class GetStorageUtil {
  static final GetStorage _box = GetStorage();

  // Initialize GetStorage
  static Future<void> init() async {
    await GetStorage.init();
  }

  // User-related methods
  static String? getUserId() => _box.read<String?>('userId');
  static String? getUserEmail() => _box.read<String?>('userEmail');
  static String? getUserName() => _box.read<String?>('userName');
  static bool isLoggedIn() => _box.read<bool>('isLoggedIn') ?? false;

  // Write user data
  static Future<void> setUserData({
    String? userId,
    String? userEmail,
    String? userName,
  }) async {
    if (userId != null) await _box.write('userId', userId);
    if (userEmail != null) await _box.write('userEmail', userEmail);
    if (userName != null) await _box.write('userName', userName);
    await _box.write('isLoggedIn', true);
  }

  // Clear user data
  static Future<void> clearUserData() async {
    await _box.remove('userId');
    await _box.remove('userEmail');
    await _box.remove('userName');
    await _box.write('isLoggedIn', false);
  }

  // Generic methods
  static T? read<T>(String key) => _box.read<T>(key);
  static Future<void> write(String key, dynamic value) =>
      _box.write(key, value);
  static Future<void> remove(String key) => _box.remove(key);
  static bool hasData(String key) => _box.hasData(key);
}
