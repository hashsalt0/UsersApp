import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../../utils/utils.dart';
import '../../utils/validations.dart';
import '../base/entry.dart';

class DeleteUserMenu extends Entry {
  DeleteUserMenu() : super(StringValues.deleteUserMenuText) {
    addStaticField<int>(
        StringValues.rollNumberSerial,
        StringValues.rollNumberPrompt,
        Utils.castToInt,
        Validations.rollNumberExistsValidation);
  }

  /// Deletes the user if entry for the roll number is found. 
  void delete(int rollNumber) {
    if (Store.instance.has(rollNumber)) {
      Store.instance.remove(rollNumber);
    } else {
      Log.error(StringValues.rollNumberNotFound);
    }
  }

  @override
  void execute() {
    super.execute();
    int rollNumber = fields[StringValues.rollNumberSerial]!.value as int;
    delete(rollNumber);
    Log.help("Deleted user having roll number - $rollNumber");
  }
}
