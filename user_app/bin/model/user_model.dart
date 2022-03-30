import '../utils/const.dart';
import '../utils/utils.dart';
import 'course.dart';

class UserModel {
  String? fullName;
  int? age;
  String? address;
  int rollNumber;
  Set<Course> courses;

  UserModel.fromJson(Map json)
      : fullName = json[Const.fullNameSerial],
        age = json[Const.ageSerial],
        address = json[Const.addressSerial],
        rollNumber = json[Const.rollNumberSerial],
        courses = Utils.getCourseSet(json[Const.coursesSerial]);


  Map toJson() => {
        Const.fullNameSerial: fullName,
        Const.ageSerial: age,
        Const.addressSerial: address,
        Const.rollNumberSerial: rollNumber,
        Const.coursesSerial: courses.map((e) => e.name).toList()
      };

    
  @override
  bool operator ==(Object other) {
    return hashCode == other.hashCode;
  }

  @override
  int get hashCode => rollNumber.hashCode;
}
