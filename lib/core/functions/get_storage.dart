import 'package:get_storage/get_storage.dart';

class StorageKeys {
  static const userId = 'userId';
  static const userEmail = 'userEmail';
  static const userName = 'userName';
}

class GetStorageUtil {
  static final GetStorage _box = GetStorage();

  // Initialize GetStorage
  static Future<void> init() async {
    await GetStorage.init();
  }

  // User-related methods
  static String? getUserId() => _box.read(StorageKeys.userId);
  static String? getUserEmail() => _box.read(StorageKeys.userEmail);
  static String? getUserName() => _box.read(StorageKeys.userName);
  static bool isLoggedIn() {
    final userId = getUserId();
    return userId != null && userId.trim().isNotEmpty;
  }

  // Write user data
  static Future<void> setUserData({
    required String userId,
    required String userEmail,
    String? userName,
  }) async {
    await _box.write(StorageKeys.userId, userId);
    await _box.write(StorageKeys.userEmail, userEmail);

    if (userName != null) {
      await _box.write(StorageKeys.userName, userName);
    }
  }

  // Clear user data
  static Future<void> clearUserData() async {
    await _box.remove(StorageKeys.userId);
    await _box.remove(StorageKeys.userEmail);
    await _box.remove(StorageKeys.userName);
  }

  // Generic methods
  static T? read<T>(String key) => _box.read<T>(key);
  static Future<void> write(String key, dynamic value) =>
      _box.write(key, value);
  static Future<void> remove(String key) => _box.remove(key);
  static bool hasData(String key) => _box.hasData(key);
}
