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
    try{
      return _localFile.readAsStringSync(encoding: utf8);
    }catch (e) {
      return "";
    }
  }

  static void save(Map<String, UserModel> store) {
    File saveFile = _localFile;
    String jsonString = jsonEncode(store.cast<String, dynamic>());
    saveFile.writeAsString(jsonString, encoding: utf8);
  }


}