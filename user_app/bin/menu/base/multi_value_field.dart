import 'dart:collection';

import '../../utils/input.dart';
import '../../utils/logger.dart';
import 'field.dart';
import 'entry.dart';
import '../../utils/validations.dart';
import '../../exceptions/input_exception.dart';

/// A Type of [Field] for [Entry] classes. It can accepts a number for which the
/// entered in the command line. ie a natural number. The number is not read
/// in the case where [_minEntry] and [_maxEntry]  are same. Based upon which
/// subsequent [T] values will be read.

class MultiValueField<T> extends Field<HashSet<T>> {
  /// the messages to be displayed when input is taken for each entry
  // single message
  final String? _entryMessage;
  // multiple message
  final List<String>? _entryMessages;

  /// minimum and maximum number of inputs that are required.
  final int _entryCount;

  MultiValueField(
      String name, String message, this._entryMessage, this._entryMessages, this._entryCount)
      : super(name, message) {
    value = HashSet();
    value!.clear();
  }

  /// Reads and returns [T] value until it is passes validation. [Validations].
  /// contains a list of validations functions for the application
  /// throws [InputException]
  T _readNextValue(int entryCount) {
    Log.info(_entryMessage ?? _entryMessages?[entryCount]);
    String? value = Input.readLine();
    if (_validateTry(value) == false) return _readNextValue(entryCount);
    return cast(value) ?? _readNextValue(entryCount);
  }

  HashSet<T>? _readNValues(int? n) {
    int count = 0;
    while (value!.length < _entryCount) {
      value?.add(_readNextValue(count++));
    }
    return value;
  }

  /// reads [_entryCount] number of [T] values and stores them in set
  /// to avoid duplicate entries.
  @override
  HashSet<T>? readValue() {
    /// Showing the help message
    Log.info(message);
    return _readNValues(_entryCount);
  }

  /// A validate fuction that is not necessary to provide
  bool Function(T? castedValue, HashSet<T>? valuesSet)? validate;

  /// A function for doing cast operation on the string
  late T? Function(String? recivedValue) cast;

  /// Handles all [InputException] that are recived while executing validate
  /// function.
  bool _validateTry(String? value) {
    return catchError(() => {validate!(cast(value), this.value)});
  }
}
