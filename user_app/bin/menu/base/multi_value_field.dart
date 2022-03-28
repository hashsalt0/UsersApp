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
  /// the message to be displayed when input is taken for each entry
  final String _entryMessage;

  /// minimum and maximum number of inputs that are required.
  final int _minEntry;
  final int _maxEntry;

  MultiValueField(String name, String message, this._entryMessage, this._minEntry,
      this._maxEntry)
      : super(name, message) {
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

  HashSet<T>? _readNValues(int? n){
      if (n != null && n >= _minEntry && n <= _maxEntry) {
        while (value!.length < _minEntry) {
          value?.add(_readNextValue());
        }
        return value;
      } else {
        Log.error("Enter a number in between $_minEntry and $_maxEntry");
        return readValue();
      }
  }

  /// Reads an integer value until it is passes validation. [Validations].
  /// contains a list of validations functions for the application
  /// return [HashSet] contain [T] values. The final value will be a non null,
  /// it tired to read until it gets the correct value.
  @override
  HashSet<T>? readValue() {
    /// Showing the help message
    Log.info(message);
    if(_minEntry == _maxEntry) {
      /// since min and max entries are same no need to ask for n value
      _readNValues(_minEntry);
    }else{
      String? line = Input.readLine();
      if (line != null) {
        return _readNValues(int.tryParse(line));
      } else {
        return readValue();
      }
    }
    return value;
  }

  /// A validate fuction that is not necessary to provide
  bool Function(T?, HashSet<T>?)? validate;

  /// A function for doing cast operation on the string
  late T? Function(String? text) cast;

  /// Handles all [InputException] that are recived while executing validate
  /// function.
  bool _validateTry(String? value) {
    return catchError(() => {validate!(cast(value), this.value)});
  }
}
