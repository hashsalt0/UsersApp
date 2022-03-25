import 'dart:convert';
import 'dart:io';

/// Input class helpful for debugging purposes
class Input {
  static String? Function()? mock;

  static String? readLine() {
    if(mock != null){
      return mock!();
    }else{
      return stdin.readLineSync(encoding: utf8);
    } 
  }
}
