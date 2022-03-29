import 'dart:collection';

import '../bin/exceptions/input_exception.dart';
import '../bin/exceptions/course_already_added_exception.dart';
import '../bin/exceptions/roll_number_already_exists_exception.dart';
import '../bin/model/course.dart';
import '../bin/model/user_model.dart';
import '../bin/utils/store.dart';
import 'package:test/test.dart';

import '../bin/utils/string_values.dart';
import '../bin/utils/validations.dart';

void main(){
  Store.instance.loadStore();
  test('Name Vaildation Test', () {
    expect(() => Validations.firstNameValidation(""), throwsA(TypeMatcher<InputException>()));    
    expect(Validations.firstNameValidation("sdji"), true);
  });
  test('Age Vaildation Test', () {
    expect(() => Validations.ageValidation(-1), throwsA(TypeMatcher<InputException>()));    
    expect(() => Validations.ageValidation(null), throwsA(TypeMatcher<InputException>()));    
    expect(() => Validations.ageValidation(0), throwsA(TypeMatcher<InputException>()));    
    expect(Validations.ageValidation(10), true);
  });
  test('Address Vaildation Test', () {
    expect(() => Validations.addressValidation(""), throwsA(TypeMatcher<InputException>()));    
    expect(Validations.addressValidation("sdji"), true);
  });

  test('Roll No Vaildation Test', () {
    expect(Validations.rollNumberValidation(2), true);
    Store.instance.add(UserModel.fromJson({
      StringValues.rollNumberSerial : 2,
      StringValues.coursesSerial : [],
    }));  
    expect(() => Validations.rollNumberValidation(2), throwsA(TypeMatcher<RollNumberAlreadyExistsException>()));
  });

  test('Courses Vaildation Test', () {
    expect(Validations.coursesValidation(Course.A, HashSet()), true);
    expect(() => Validations.coursesValidation(Course.A, HashSet.from([Course.A])), throwsA(TypeMatcher<CourseAlreadyAddedException>()));
  });

}
