import 'dart:collection';

import '../../utils/input.dart';
import '../../utils/logger.dart';
import '../../utils/utils.dart';
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
  final String _entryMessage;

  /// minimum and maximum number of inputs that are required.
  final int _entryCount;

  MultiValueField(
      {required String name,
      required String message,
      required String entryMessage,
      required int entryCount,
      required this.cast,
      this.validate})
      : _entryMessage = entryMessage,
        _entryCount = entryCount,
        super(name: name, message: message) {
    value = HashSet();
  }

  /// Reads and returns [T] value until it is passes validation. [Validations].
  /// contains a list of validations functions for the application
  /// throws [InputException]
  T _readNextValue() {
    Log.info(_entryMessage);
    String? value = Input.readLine();
    if (_validateTry(value) == false) return _readNextValue();
    return cast(value) ?? _readNextValue();
  }

  HashSet<T>? _readNValues(int? n) {
    while (value!.length < _entryCount) {
      value?.add(_readNextValue());
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
    return Utils.catchError(() => {validate!(cast(value), this.value)});
  }
}
