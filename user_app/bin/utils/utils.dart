import '../exceptions/input_exception.dart';
import '../menu/base/field.dart';
import '../model/course.dart';
import '../model/user_model.dart';
import 'string_values.dart';

class Utils {
  static UserModel fromFeildMap(Map<String, Field> map) {
    var transformedMap = map.map((key, value) => MapEntry(key, value.value));
    final deserializedUserModel = UserModel.fromJson(transformedMap);
    return deserializedUserModel;
  }

  static Course castToCourse(String? text) {
    if (text == null) {
      throw InputException("${StringValues.coursesError} $text");
    }
    try {
      return Course.values.byName(text);
    } catch (e) {
      throw InputException("${StringValues.coursesError} $text");
    }
  }

  static int castToInt(String? text) {
    try {
      return int.parse(text ?? "");
    } catch (e) {
      throw InputException("${StringValues.rollNumberError} $text");
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
