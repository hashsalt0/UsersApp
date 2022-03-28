import 'dart:collection';
import 'dart:convert';
import 'dart:io';


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

  void saveStore() {
    FilesUtils.save(_store);
  }

  void add(UserModel model) {
    _store.putIfAbsent(model.rollNumber.toString(), () => model);
  }

  bool has(int? value) {
    return _store.containsKey(value.toString());
  }

  /// Returns [List] of [UserModel] in sorted order according to roll number
  /// @params [compare] function to sort the list according to some condition
  List<UserModel> listOfUser(int Function(UserModel a, UserModel b) compare) {
    List<UserModel> users = _store.values.toList();
    users.sort((a, b) => compare(a, b));
    return users;
  }

  void remove(int rollNumber) {
    _store.remove(rollNumber.toString());
  }
}
