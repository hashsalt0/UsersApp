import 'dart:collection';

import 'package:test/test.dart';

import '../bin/menu/base/multi_value_field.dart';
import '../bin/menu/base/field.dart';
import '../bin/menu/base/single_value_field.dart';
import '../bin/model/course.dart';
import '../bin/model/user_model.dart';
import '../bin/utils/const.dart';
import '../bin/utils/utils.dart';

void main() {
  test('Local Save File Exists Test', () {
    UserModel model = UserModel.fromJson({
      Const.rollNumberSerial: 1,
      Const.coursesSerial: {Course.A.name, Course.B.name},
      Const.addressSerial: "john",
      Const.fullNameSerial: "ron swanson",
      Const.ageSerial: 10
    });
    Map<String, Field> map = {
      Const.rollNumberSerial: SingleValueField<int>(
          name: "", message: "", cast: Utils.castToInt, validate: (e) => true)
        ..value = 1,
      Const.addressSerial: SingleValueField<String>(
          name: "",
          message: "",
          cast: Utils.castToString,
          validate: (e) => true)
        ..value = "john",
      Const.secondNameSerial: SingleValueField<String>(
          name: "",
          message: "",
          cast: Utils.castToString,
          validate: (e) => true)
        ..value = "swanson",
      Const.firstNameSerial: SingleValueField<String>(
          name: "",
          message: "",
          cast: Utils.castToString,
          validate: (e) => true)
        ..value = "ron",
      Const.ageSerial: SingleValueField<int>(
          name: "", message: "", cast: Utils.castToInt, validate: (e) => true)
        ..value = 10,
      Const.coursesSerial: MultiValueField<Course>(
          name: "",
          message: "",
          entryMessage: "",
          entryCount: 1,
          cast: Utils.castToCourse,
          validate: (e, x) => true)
        ..value = HashSet.of([Course.A, Course.B]),
    };
    UserModel toTest = Utils.fromFeildMap(map);
    expect(toTest == model, true);
  });
}
