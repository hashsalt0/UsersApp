import '../../model/course.dart';
import '../../model/user_model.dart';
import '../../utils/config.dart';
import '../../utils/const.dart';
import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../../utils/utils.dart';
import '../../utils/validations.dart';
import '../base/entry.dart';
import '../base/field.dart';
import '../base/multi_value_field.dart';
import '../base/single_value_field.dart';

/// Add user menu
class AddUserMenu extends Entry {
  final List<Field> _fields = [
    SingleValueField<String>(
        Const.firstNameSerial,
        StringValues.firstNamePrompt,
        Utils.castToString,
        Validations.firstNameValidation),
    SingleValueField<String>(
        Const.secondNameSerial,
        StringValues.secondNamePrompt,
        Utils.castToString,
        Validations.secondNameValidation),
    SingleValueField<String>(Const.addressSerial, StringValues.addressPrompt,
        (s) => s, Validations.addressValidation),
    SingleValueField<int>(Const.ageSerial, StringValues.agePrompt,
        Utils.castToInt, Validations.ageValidation),
    SingleValueField<int>(
        Const.rollNumberSerial,
        StringValues.rollNumberPrompt,
        Utils.castToInt,
        Validations.rollNumberValidation),
    MultiValueField<Course>(
        Const.coursesSerial,
        StringValues.coursesPrompt,
        StringValues.coursesEntryPrompt,
        Config.courseEntry,
        Utils.castToCourse,
        Validations.coursesValidation)
  ];

  AddUserMenu() : super(StringValues.addUserMenuText) {
    for (var field in _fields) {
      addField(field);
    }
  }

  @override
  void execute() {
    super.execute();
    UserModel model = Utils.fromFeildMap(fields);
    Store.instance.add(model);
    Log.help(StringValues.addUserMenuSucess);
  }
}
