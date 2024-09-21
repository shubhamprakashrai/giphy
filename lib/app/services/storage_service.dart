

import 'package:flutter/foundation.dart';
import 'package:giphyapp/app/utils/app_constant/app_constants.dart';
import 'package:giphyapp/app/services/app_type_def.dart';
import 'package:giphyapp/app/services/base_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';


/// [StorageService] is Use to manage all the Storage related works in the app
/// It uses [HiveBoxName] where box names are defined
/// It uses [HiveConstants], where keys are store for any particular value
class StorageService implements BaseService<FVoid, String>{

  /// Singleton [service] is a singleton of [StorageService]
  static final StorageService service = StorageService();

  /// [authBox] saves all the auth related data
  Box? authBox;

  /// [coreBox] saves all the core related data
  Box? coreBox;

  /// Use to save the directory [path]
  late final String path;

  FVoid addDataToLocal(String hiveBoxName, data) async {
    final box = await Hive.openBox(hiveBoxName);
    await box.add(data);
    await box.close();
  }


  FVoid addDataToLocalViaKey(String hiveBoxName, String key, value) async {
    final box = await Hive.openBox(hiveBoxName);
    // Find the index or key based on your use case and update the data
    // For example: box.put(index, data);
    await box.close();
  }


  FVoid deleteDataFromLocal(String hiveBoxName, int index) async {
    final box = await Hive.openBox(hiveBoxName);
    // Delete data based on the index or key
    // For example: box.deleteAt(index);
    await box.close();
  }

  FVoid deleteEntireBoxData(String hiveBoxName) async {
    await Hive.deleteBoxFromDisk(hiveBoxName);
  }

  @override
  FVoid init({String? param}) async {
    try {
      if(!kIsWeb)path = param ?? (await getApplicationDocumentsDirectory()).path;
      debugPrint("Path is $path");
      await Hive.initFlutter(path);
      await openBoxes();
    } catch (e) {
      debugPrint("Error IN storage init $e");
    }
    debugPrint("Storage Service init");
  }

  Future readDataFromLocal(String hiveBoxName) async {
    final box = await Hive.openBox(hiveBoxName);
    final data = box.values.first; // Adjust as needed for your use case
    await box.close();
    return data;
  }


  Future readDataFromLocalViaKey(String hiveBoxName, String key) async {
    final box = await Hive.openBox(hiveBoxName);
    var data = box.get(key); // Adjust as needed for your use case
    await box.close();
    return data;
  }


  FVoid updateDataToLocal(String hiveBoxName, data) async {
    final box = await Hive.openBox(hiveBoxName);
    // Find the index or key based on your use case and update the data
    // For example: box.put(index, data);
    await box.close();
  }

  FVoid openBoxes() async {
    authBox = await Hive.openBox(HiveBoxName.authBox);
    coreBox = await Hive.openBox(HiveBoxName.appCoreBox);
  }

  dynamic getAuth({required String key}) {
    return service.authBox?.get(key);
  }

  FVoid setAuth({required String key, required value}) async {
    return await service.authBox?.put(key, value).then((onValue){
      debugPrint("Data Saved to hive: $key");
    }).onError((error, s){
      debugPrint("Error Saving Data to Auth [$key]: $s - $error");
    });
  }

  FVoid setCore({required dynamic value, required String key}) async {
    try {
      await coreBox?.put(key, value);
    } catch (e) {
      debugPrint("Error Saving data to Core BOx $value");
    }
  }

  dynamic getCore({required String key}) {
    return coreBox?.get(key);
  }

  Future<int> clearAuth() async {
    return await authBox?.clear() ?? -1;
  }

  Future<int> clearCore() async {
    return await coreBox?.clear() ?? -1;
  }
}