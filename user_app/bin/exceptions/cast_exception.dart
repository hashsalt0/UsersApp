import 'input_exception.dart';

/// Type of [InputException] thrown when user enters a value that cannont
/// be converted to a type.

class CastException extends InputException {
  CastException(cause) : super(cause, "");
}
