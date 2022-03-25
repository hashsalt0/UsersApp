import '../bin/model/course.dart';
import '../bin/model/user_model.dart';
import '../bin/utils/store.dart';
import 'package:test/test.dart';

import '../bin/utils/string_values.dart';

void main() {
  test('Local Save File Exists Test',
      () async => expect(await Store.instance.localFile.exists(), true));

  test('Local Save File Exists Test', () {
    UserModel model = UserModel.fromJson({
      StringValues.rollNumberSerial: 1,
      StringValues.courses: {Course.A, Course.B},
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
      StringValues.courses: {Course.A, Course.B},
      StringValues.addressSerial: "john",
      StringValues.fullNameSerial: "ron",
      StringValues.ageSerial: 10
    });
    var modelRead = Store.instance.loadStore()["1"]; 
    expect(modelRead == model, true);
  });
}
