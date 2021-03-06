import '../exceptions/cast_exception.dart';
import '../exceptions/input_exception.dart';
import '../menu/base/field.dart';
import '../model/course.dart';
import '../model/user_model.dart';
import 'const.dart';
import 'logger.dart';
import 'string_values.dart';

class Utils {
  static String castToString(String? text) => text.toString();

  static UserModel fromFeildMap(Map<String, Field> map) {
    var transformedMap = map.map((key, value) => MapEntry(key, value.value));
    transformedMap.putIfAbsent(
        Const.fullNameSerial,
        () =>
            "${transformedMap[Const.firstNameSerial]} ${transformedMap[Const.secondNameSerial]}");
    final deserializedUserModel = UserModel.fromJson(transformedMap);
    return deserializedUserModel;
  }

  static Course castToCourse(String? text) {
    if (text == null) {
      throw CastException("${StringValues.coursesError} $text");
    }
    try {
      return Course.values.byName(text.toUpperCase());
    } catch (e) {
      throw CastException("${StringValues.coursesError} $text");
    }
  }

  static bool catchError(Function block) {
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

  static int castToInt(String? text) {
    try {
      return int.parse(text ?? "");
    } catch (e) {
      throw CastException("${StringValues.rollNumberError} $text");
    }
  }

  static Set<Course> getCourseSet(dynamic value) {
    if (value is List) {
      return value.cast<String>().map((e) => castToCourse(e)).toSet();
    } else if (value is Set) {
      return value.cast<Course>();
    } else {
      throw Exception();
    }
  }
}
