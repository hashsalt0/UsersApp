import 'package:test/test.dart';

import '../bin/user_app_looper.dart';
import '../bin/utils/input.dart';
import '../bin/utils/logger.dart';
/// passes on debug but stucks on run.
void main() {
  test('testing add user and saving to disk', () {
    var input = [
      '1',
      'Snehil',
      'Snehil',
      'patna',
      '10',
      '10',
      'A',
      'B',
      'C',
      'D',
      '4',
      '1',
      'Ajay',
      'Ajay',
      'patna',
      '10',
      '11',
      'A',
      'B',
      'C',
      'E',
      '5',
      '1'
    ].toList().iterator;

    Input.mock = () {
      if (input.moveNext()) return input.current;
      return "5";
    };
    List<String> output = [];
    Log.mock = (Object? got) {
      output.add(got!.toString());
    };
    UserAppLooper().run();
    bool toTest = output.contains("[33mSucessfully saved store to disk.[0m");
    expect(toTest, true);
  }, timeout: Timeout.parse("1s"));
  test('delete test', () {
    var input = ['3', '10', '4', '5'].toList().iterator;
    Input.mock = () {
      if (input.moveNext()) return input.current;
      return "blank";
    };
    List<String> output = [];
    Log.mock = (Object? got) {
      output.add(got!.toString());
    };
    UserAppLooper().run();
    bool toTest = output.contains("Deleted user having roll number - 10");
    expect(toTest, true);
  }, timeout: Timeout.parse("1s"));
}
