import '../utils/string_values.dart';
import '../utils/utils.dart';
import 'course.dart';

class UserModel {
  String? fullName;
  int? age;
  String? address;
  int rollNumber;
  Set<Course> courses;

  UserModel.fromJson(Map json)
      : fullName = json[StringValues.fullNameSerial],
        age = json[StringValues.ageSerial],
        address = json[StringValues.addressSerial],
        rollNumber = json[StringValues.rollNumberSerial],
        courses = Utils.getCourseSet(json[StringValues.coursesSerial]);


  Map toJson() => {
        StringValues.fullNameSerial: fullName,
        StringValues.ageSerial: age,
        StringValues.addressSerial: address,
        StringValues.rollNumberSerial: rollNumber,
        StringValues.coursesSerial: courses.map((e) => e.name).toList()
      };

    
  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }

  @override
  int get hashCode => rollNumber.hashCode;
}
