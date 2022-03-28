import 'dart:collection';

import 'multi_value_field.dart';
import 'menu.dart';
import 'field.dart';
import 'single_value_field.dart';

/// An entry is the type of menu that accepts values.
/// It has a [Map] of [Field] that contains [SingleValueField] or [MultiValueField]
/// It accepts till all the values of [Field] are accepted.

class Entry extends Menu {
  Entry(String name) : super(name);

  final Map<String, Field> fields = {};

  void addSingleValueField<T>(
      String name,
      String message,
      T? Function(String? text) cast,
      bool Function(T?)? validationFunction) {
    SingleValueField<T> newField = SingleValueField(name, message)
      ..validate = validationFunction
      ..cast = cast;
    fields.putIfAbsent(name, () => newField);
  }

  void addMultiValueField<T>(
      String name,
      String message,
      String entryMessage,
      int entryCount,
      T? Function(String? text) cast,
      bool Function(T?, HashSet<T>?)? validationFunction) {
    MultiValueField<T> newField = MultiValueField(name, message, entryMessage, null, entryCount)
      ..validate = validationFunction
      ..cast = cast;
    fields.putIfAbsent(name, () => newField);
  }

void addMultiValueFieldWithDifferentMessages<T>(
      String name,
      String message,
      List<String> entryMessages,
      int entryCount,
      T? Function(String? text) cast,
      bool Function(T?, HashSet<T>?)? validationFunction) {
    MultiValueField<T> newField = MultiValueField(name, message, null, entryMessages, entryCount)
      ..validate = validationFunction
      ..cast = cast;
    fields.putIfAbsent(name, () => newField);
  }

  @override
  void execute() {
      for (var subMenu in fields.values) { 
        subMenu.readValue(); 
      }
  }
}