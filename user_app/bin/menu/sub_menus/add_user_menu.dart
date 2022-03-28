import '../../model/course.dart';
import '../../model/user_model.dart';
import '../../utils/config.dart';
import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../../utils/utils.dart';
import '../../utils/validations.dart';
import '../base/entry.dart';

/// Add user menu
class AddUserMenu extends Entry {
  AddUserMenu() : super(StringValues.addUserMenuText) {
    addSingleValueField<String>(StringValues.fullNameSerial,
        StringValues.fullNamePrompt, (s) => s, Validations.nameValidation);
    addSingleValueField<String>(StringValues.addressSerial,
        StringValues.addressPrompt, (s) => s, Validations.addressValidation);
    addSingleValueField<int>(StringValues.ageSerial, StringValues.agePrompt,
        Utils.castToInt, Validations.ageValidation);
    addSingleValueField<int>(
        StringValues.rollNumberSerial,
        StringValues.rollNumberPrompt,
        Utils.castToInt,
        Validations.rollNumberValidation);

    addMultiValueField<Course>(
        StringValues.coursesSerial,
        StringValues.coursesPrompt,
        StringValues.coursesEntryPrompt,
        Config.minCourseEntry,
        Config.maxCourseEntry,
        Utils.castToCourse,
        Validations.coursesValidation);
  }

  @override
  void execute() {
    super.execute();
    UserModel model = Utils.fromFeildMap(fields);
    Store.instance.add(model);
    Log.help(StringValues.addUserMenuSucess);
  }
}