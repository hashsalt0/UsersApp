import 'input_exception.dart';
import '../model/course.dart';

/// Type of [InputException] thrown when user enters the same [Course] which he
/// has already entered.

class CourseAlreadyAddedException extends InputException {
  CourseAlreadyAddedException(cause)
      : super(cause, "You have already entered the same course before.");
}
