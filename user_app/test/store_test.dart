import '../bin/model/course.dart';
import '../bin/model/user_model.dart';
import '../bin/utils/store.dart';
import 'package:test/test.dart';

import '../bin/utils/string_values.dart';

void main() {
  Store.instance.loadStore();
  test('Local Save File Exists Test', () {
    UserModel model = UserModel.fromJson({
      StringValues.rollNumberSerial: 1,
      StringValues.coursesSerial: {Course.A, Course.B},
      StringValues.addressSerial: "john",
      StringValues.fullNameSerial: "ron",
      StringValues.ageSerial: 10
    });
    Store.instance.add(model);
    expect(() {
      Store.instance.saveStore();
    }, returnsNormally);
  });

  test('Local Save File Read Test', () {
    UserModel model = UserModel.fromJson({
      StringValues.rollNumberSerial: 1,
      StringValues.coursesSerial: {Course.A, Course.B},
      StringValues.addressSerial: "john",
      StringValues.fullNameSerial: "ron",
      StringValues.ageSerial: 10
    });
    var modelRead = Store.instance.listOfUser((a, b) => a.fullName?.compareTo(b.fullName ?? "") ?? -1).first; 
    expect(modelRead == model, true);
  });
}
