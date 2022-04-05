import '../bin/model/course.dart';
import '../bin/model/user_model.dart';
import '../bin/utils/const.dart';
import '../bin/utils/store.dart';
import 'package:test/test.dart';

void main() {
  Store.instance.loadStore();
  test('Local Save File Exists Test', () {
    UserModel model = UserModel.fromJson({
      Const.rollNumberSerial: 1,
      Const.coursesSerial: {Course.A, Course.B},
      Const.addressSerial: "john",
      Const.fullNameSerial: "ron",
      Const.ageSerial: 10
    });
    Store.instance.add(model);
    expect(() {
      Store.instance.saveStore();
    }, returnsNormally);
  });

  test('Local Save File Read Test', () {
    UserModel model = UserModel.fromJson({
      Const.rollNumberSerial: 1,
      Const.coursesSerial: {Course.A, Course.B},
      Const.addressSerial: "john",
      Const.fullNameSerial: "ron",
      Const.ageSerial: 10
    });
    var modelRead = Store.instance
        .listOfUser(({required UserModel a, required UserModel b}) =>
            a.fullName?.compareTo(b.fullName ?? "") ?? 0)
        .first;
    expect(modelRead == model, true);
  });
}
