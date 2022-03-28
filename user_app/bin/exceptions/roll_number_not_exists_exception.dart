import 'input_exception.dart';

/// Type of [InputException] thrown when user enters a roll number that is valid
/// but is not present in the memory of application.

class RollNumberNotExistsException extends InputException {
  RollNumberNotExistsException(cause)
      : super(cause,
            "The roll number that you have entered is not present in the storage.");
}
