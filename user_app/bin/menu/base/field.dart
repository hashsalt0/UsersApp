import '../../exceptions/course_already_added_exception.dart';
import '../../exceptions/input_exception.dart';
import '../../exceptions/invalid_choice_exception.dart';
import '../../exceptions/roll_number_already_exists_exception.dart';
import '../../utils/logger.dart';

abstract class Field<T> {
  final String name;
  // can be protected but no option in dart
  final String message;

  late T? value;

  Field(this.name, this.message);

  T? readValue();

  /// catches all the [InputException] and logs it according to the log level.
  bool catchError(Function block) {
    try {
      block();
      return true;
    } on RollNumberAlreadyExistsException catch (e) {
      Log.debug(e);
      Log.help("The roll number that you have entered is already present in the file storage.");
    } on InvalidChoiceException catch (e) {
      Log.debug(e);
      Log.help("Enter the option as specified by the prompt.");
    } on CourseAlreadyAddedException catch (e) {
      Log.debug(e);
      Log.help("You have already entered the same course before.");
    } on InputException catch (e, stackTrace) {
      Log.error("Input Exception have occured.");
      Log.debug(e);
      Log.debug(stackTrace);
    } catch (e, stackTrace) {
      Log.debug(e);
      Log.debug(stackTrace);
    }
    return false;
  }
}
