import 'dart:convert';
import 'dart:io';

import 'package:file/local.dart';

import '../model/user_model.dart';
import 'config.dart';

class Store {
  // json encoder only support string map
  late final Map<String, UserModel> _store;

  Store._();

  static final Store _instance = Store._();

  static Store get instance {
    return _instance;
  }

  File get localFile {
    final saveDir = LocalFileSystem().systemTempDirectory;
    final file = File("${saveDir.path}\\${Config.saveFile}");
    if (file.existsSync() == false) file.create();
    return file;
  }

  loadStore() {
    String saveFileString = localFile.readAsStringSync();
    if (saveFileString.isEmpty) {
      _store = {};
    } else {
      _store = (jsonDecode(saveFileString) as Map)
          .map((key, value) => MapEntry(key, UserModel.fromJson(value)));
    }
  }

  void saveStore() {
    File saveFile = localFile;
    String jsonString = jsonEncode(_store.cast<String, dynamic>());
    saveFile.writeAsString(jsonString, encoding: utf8);
  }

  void add(UserModel model) {
    _store.putIfAbsent(model.rollNumber.toString(), () => model);
  }

  bool has(int? value) {
    return _store.containsKey(value.toString());
  }

  /// Returns [List] of [UserModel] in sorted order according to roll number
  List<UserModel> listOfUser() {
    List<UserModel> users = _store.values.toList();
    users.sort((a, b) => a.rollNumber.compareTo(b.rollNumber));
    return users;
  }

  void remove(int rollNumber) {
    _store.remove(rollNumber.toString());
  }
}
