import 'input_exception.dart';

/// Type of [InputException] thrown when user enters a value that is
/// not valid due to some validation criteria. eg age > 100 or etc

class InvalidInputException extends InputException {
  InvalidInputException(cause) : super(cause, "Entered field is not valid");
}
