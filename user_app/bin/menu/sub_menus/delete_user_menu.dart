import '../../utils/const.dart';
import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../../utils/utils.dart';
import '../../utils/validations.dart';
import '../base/entry.dart';
import '../base/field.dart';
import '../base/single_value_field.dart';

class DeleteUserMenu extends Entry {
  final Field<int> _field =   SingleValueField<int>(
        Const.rollNumberSerial,
        StringValues.rollNumberPrompt,
        Utils.castToInt,
        Validations.rollNumberExistsValidation);
  

  DeleteUserMenu() : super(StringValues.deleteUserMenuText) {
    addField(_field);
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
    int rollNumber = fields[Const.rollNumberSerial]!.value as int;
    delete(rollNumber);
    Log.help("Deleted user having roll number - $rollNumber");
  }
}