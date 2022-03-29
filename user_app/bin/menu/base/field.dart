import '../../exceptions/input_exception.dart';
import '../../utils/logger.dart';
import '../../utils/utils.dart';

abstract class Field<T> {
  final String name;
  // can be protected but no option in dart
  final String message;

  late T? value;

  Field(this.name, this.message);

  T? readValue();

  /// catches all the [InputException] and logs it according to the log level.
  bool catchError(Function block) {
    return Utils.catchError(block);
  }
}
