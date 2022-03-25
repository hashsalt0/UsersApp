
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../bin/model/course.dart';
import '../bin/utils/utils.dart';

void main(List<String> args) {
  test("Getting Course Enum From String Test", (){
    expect(Utils.castToCourse("A"), Course.A);
    expect(Utils.castToCourse("X"), throwsArgumentError);
  });  
}