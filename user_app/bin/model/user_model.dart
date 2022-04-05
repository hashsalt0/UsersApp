import '../utils/const.dart';
import '../utils/utils.dart';
import 'course.dart';

class UserModel implements Comparable{
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
    return other is UserModel && rollNumber == other.rollNumber;
  }

  @override
  int get hashCode => rollNumber.hashCode;

  UserModel.fromRollNumber(int value) :
        rollNumber = value,
        courses = {};

  @override
  int compareTo(other) {
     return rollNumber.compareTo(other.rollNumber);
  }
}
