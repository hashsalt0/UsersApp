import 'dart:convert';
import 'dart:io';

/// Input class helpful for debugging purposes
class Input {
  static String? Function()? mock;

  static String? readLine() {
    return mock?.call() ?? stdin.readLineSync(encoding: utf8);
  }
}
