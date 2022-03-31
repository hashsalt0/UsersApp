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
        name: Const.firstNameSerial,
        message: StringValues.firstNamePrompt,
        cast: Utils.castToString,
        validate: Validations.nameValidation),
    SingleValueField<String>(
        name: Const.secondNameSerial,
        message: StringValues.secondNamePrompt,
        cast: Utils.castToString,
        validate: Validations.nameValidation),
    SingleValueField<String>(
        name: Const.addressSerial,
        message: StringValues.addressPrompt,
        cast: (s) => s,
        validate: Validations.addressValidation),
    SingleValueField<int>(
        name: Const.ageSerial,
        message: StringValues.agePrompt,
        cast: Utils.castToInt,
        validate: Validations.ageValidation),
    SingleValueField<int>(
        name: Const.rollNumberSerial,
        message: StringValues.rollNumberPrompt,
        cast: Utils.castToInt,
        validate: Validations.rollNumberValidation),
    MultiValueField<Course>(
        name: Const.coursesSerial,
        message: StringValues.coursesPrompt,
        entryMessage: StringValues.coursesEntryPrompt,
        entryCount: Config.courseEntry,
        cast: Utils.castToCourse,
        validate: Validations.coursesValidation)
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
