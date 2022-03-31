
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/exceptions/cast_exception.dart';
import '../bin/model/course.dart';
import '../bin/utils/utils.dart';

void main() {
  test("Getting Course Enum From String Test", (){
    expect(Utils.castToCourse("A") == Course.A, true) ;
    expect(Utils.castToCourse("a") == Course.A, true);
    expect(()=>{Utils.castToCourse("X")}, throwsA(TypeMatcher<CastException>()));
  });  
}