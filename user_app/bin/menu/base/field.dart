import '../../exceptions/input_exception.dart';
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
    } on InputException catch (e, stackTrace) {
      Log.help(e.displayMessage);
      Log.help(e.errorMessage);
      Log.debug(e);
      Log.debug(stackTrace);
    } catch (e, stackTrace) {
      Log.debug(e);
      Log.debug(stackTrace);
    }
    return false;
  }
}
