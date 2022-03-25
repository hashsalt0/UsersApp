import 'dart:collection';

import '../exceptions/input_exception.dart';
import '../exceptions/course_already_added_exception.dart';
import '../exceptions/roll_number_already_exists_exception.dart';
import '../model/course.dart';
import 'store.dart';
import '../menu/base/field.dart';
import '../menu/sub_menus/delete_user_menu.dart';

/// Validations rules for [Field] throws [InputException] 
class Validations {

  /// Validations rules for name [Field] throws [InputException]
  static bool nameValidation(String? value){
    if(value!.isEmpty) throw InputException("Name cannot be empty");
    return true;
  }

  /// Validations rules for age [Field] throws [InputException]
  static bool ageValidation(int? value){
    if(value == null || value < 1) throw InputException("Age is Invalid");
    return true;
  }

  /// Validations rules for roll number [Field] throws [InputException]
  static bool rollNumberValidation(int? value){
    if(value == null) return false;
    if(Store.instance.has(value) == true) throw RollNumberAlreadyExistsException("$value is already present");
    return true;
  }

  /// Validations rules for address [Field] throws [InputException]
  static bool addressValidation(String? value){
    if(value!.isEmpty) throw InputException("Address cannot be empty");
    return true;
  }

  /// Validations rules for course [Field] throws [InputException]
  static bool coursesValidation(Course? enteredValue, HashSet<Course>? container){
    if(container == null) return false;
    if(container.contains(enteredValue)) throw CourseAlreadyAddedException(enteredValue?.toString());
    return true;
  }

  /// Validations rules for [DeleteUserMenu] throws [InputException]
  static bool rollNumberExistsValidation(int? value){
    if(value == null) return false;
    if(Store.instance.has(value) == false) throw InputException("Roll number $value does not exists.");
    return true;
  }
}