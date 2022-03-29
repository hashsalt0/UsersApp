import 'dart:collection';

import 'package:test/test.dart';

import '../bin/menu/base/multi_value_field.dart';
import '../bin/menu/base/field.dart';
import '../bin/menu/base/single_value_field.dart';
import '../bin/model/course.dart';
import '../bin/model/user_model.dart';
import '../bin/utils/string_values.dart';
import '../bin/utils/utils.dart';

void main() {
  test('Local Save File Exists Test', () {
    UserModel model = UserModel.fromJson({
      StringValues.rollNumberSerial: 1,
      StringValues.coursesSerial: {Course.A.name, Course.B.name},
      StringValues.addressSerial: "john",
      StringValues.fullNameSerial: "ron swanson",
      StringValues.ageSerial: 10
    });
    Map<String, Field> map = {
      StringValues.rollNumberSerial:
          SingleValueField<int>("", "", Utils.castToInt, (e) => true)
            ..value = 1,
      StringValues.addressSerial:
          SingleValueField<String>("", "", Utils.castToString, (e) => true)
            ..value = "john",
      StringValues.secondNameSerial:
          SingleValueField<String>("", "", Utils.castToString, (e) => true)
          ..value = "swanson",
      StringValues.firstNameSerial:
          SingleValueField<String>("", "", Utils.castToString, (e) => true)
            ..value = "ron",
      StringValues.ageSerial:
          SingleValueField<int>("", "", Utils.castToInt, (e) => true)
            ..value = 10,
      StringValues.coursesSerial: MultiValueField<Course>(
          "", "", "", 1, Utils.castToCourse, (e, x) => true)
        ..value = HashSet.of([Course.A, Course.B]),
    };
    UserModel toTest = Utils.fromFeildMap(map);
    expect(toTest == model, true);
  });
}
