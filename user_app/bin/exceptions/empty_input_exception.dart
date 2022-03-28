import 'input_exception.dart';

/// Type of [InputException] thrown when user enters an empty or blank value
/// "" or  " (spaces)   "

class EmptyInputException extends InputException {
  EmptyInputException(cause)
      : super(cause, "Entered field cannot be empty or blank");
}
