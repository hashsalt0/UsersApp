import 'input_exception.dart';
import '../menu/base/choice.dart';

/// Type of [InputException] thrown when user enters an Invalid choice from the
/// [Choice] menu.

class InvalidChoiceException extends InputException {
  InvalidChoiceException(cause)
      : super(cause, "Enter the option as specified by the prompt.");
}
