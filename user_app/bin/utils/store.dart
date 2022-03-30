import 'dart:collection';
import 'dart:convert';

import '../model/user_model.dart';
import 'files_utils.dart';

class Store {
  // json encoder only support string map
  late final SplayTreeSet<UserModel> _store;

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
      _store = SplayTreeSet();
    } else {
      Set<UserModel> decodedSet = (jsonDecode(saveFileString) as Set).map((json) => UserModel.fromJson(json)).toSet();
      _store = SplayTreeSet.from(decodedSet, (x, y) => x.rollNumber.compareTo(y.rollNumber));
    }
  }

  /// Saves [_store] to store file.
  void saveStore() {
    FilesUtils.save(_store);
  }

  /// add user model if it is absent.
  void add(UserModel model) {
    _store.add(model);
  }

  bool has(int? value) {
    return value != null && _store.contains(UserModel.fromRollNumber(value));
  }

  /// Returns [Set] of [UserModel] in sorted order according to roll number
  /// @params [compare] function to sort the list according to some condition
  Set<UserModel> listOfUser(int Function({required UserModel a, required UserModel b}) compare) {
    return SplayTreeSet.from(_store, (a, b) =>  compare(a: a, b: b));
  }

  void remove(int rollNumber) {
    _store.remove(rollNumber.toString());
  }
}
