import 'dart:collection';
import 'dart:convert';

import '../model/user_model.dart';
import 'files_utils.dart';

class Store {
  // json encoder only support string map
  late final SplayTreeMap<String, UserModel> _store;

  // Flag to state weather the application is running or not.
  bool isRunning = true;

  Store._();

  static final Store _instance = Store._();

  static Store get instance {
    return _instance;
  }

  /// Reads the store file and loads it into memory
  loadStore() {
    String saveFileString = FilesUtils.readSaveFileAsString();
    if (saveFileString.isEmpty) {
      _store = SplayTreeMap();
    } else {
      Map<String, UserModel> decodedMap = (jsonDecode(saveFileString) as Map)
          .map((key, value) => MapEntry(key, UserModel.fromJson(value)));
      _store = SplayTreeMap.from(decodedMap);
    }
  }

  /// Saves [_store] to store file.
  void saveStore() {
    FilesUtils.save(_store);
  }

  /// add user model if it is absent.
  void add(UserModel model) {
    _store.putIfAbsent(model.rollNumber.toString(), () => model);
  }

  bool has(int? value) {
    return _store.containsKey(value.toString());
  }

  /// Returns [List] of [UserModel] in sorted order according to roll number
  /// @params [compare] function to sort the list according to some condition
  List<UserModel> listOfUser(int Function(UserModel a, UserModel b) compare) {
    List<UserModel> listOfUser = _store.values.toList();
    listOfUser.sort(compare);
    return listOfUser;
  }

  void remove(int rollNumber) {
    _store.remove(rollNumber.toString());
  }
}
