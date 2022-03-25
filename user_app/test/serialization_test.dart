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
      StringValues.courses: {Course.A, Course.B},
      StringValues.addressSerial: "john",
      StringValues.fullNameSerial: "ron",
      StringValues.ageSerial: 10
    });
    Map<String, Field> map = {
      StringValues.rollNumberSerial: SingleValueField<int>("", "")..value = 1,
      StringValues.addressSerial: SingleValueField<String>("", "")..value = "john",
      StringValues.fullNameSerial: SingleValueField<String>("", "")..value = "ron",
      StringValues.ageSerial: SingleValueField<int>("", "")..value = 10,
      StringValues.courses: MultiValueField<Course>("", "", "", 1, 1)..value = HashSet.of([Course.A, Course.B]),
    };
    UserModel toTest = Utils.fromFeildMap(map);
    expect(toTest == model, true);
  });
}
