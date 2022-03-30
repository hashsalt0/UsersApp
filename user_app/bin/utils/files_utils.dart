import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:file/local.dart';
import '../model/user_model.dart';
import 'config.dart';

class FilesUtils {
  static File get _localFile {
    final saveDir = LocalFileSystem().systemTempDirectory;
    final file = File("${saveDir.path}\\${Config.saveFile}");
    if (file.existsSync() == false) file.create();
    return file;
  }

  static String readSaveFileAsString() {
    try {
      return _localFile.readAsStringSync(encoding: utf8);
    } catch (e) {
      return "";
    }
  }

  static Set<UserModel> getUserModelsSet() {
    String saveFileString = FilesUtils.readSaveFileAsString();
    if (saveFileString.isEmpty) {
      return {};
    } else {
      return (jsonDecode(readSaveFileAsString()) as List)
          .map((json) => UserModel.fromJson(json))
          .toSet();
    }
  }

  static void save(Set<UserModel> store) {
    File saveFile = _localFile;
    String jsonString = jsonEncode(store.cast<dynamic>().toList());
    saveFile.writeAsString(jsonString, encoding: utf8);
  }
}
