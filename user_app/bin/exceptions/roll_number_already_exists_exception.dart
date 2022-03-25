
import 'input_exception.dart';

/// Type of [InputException] thrown when user enters a roll number that is valid 
/// but is already present in the memory of application.

class RollNumberAlreadyExistsException extends InputException{
  RollNumberAlreadyExistsException(cause) : super(cause);
}