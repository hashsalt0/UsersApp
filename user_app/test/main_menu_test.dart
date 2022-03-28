import 'package:test/test.dart';

import '../bin/looper.dart';
import '../bin/utils/input.dart';
import '../bin/utils/logger.dart';
/// passes on debug but stucks on run.
void main() {
  test('testing add user and saving to disk', () {
    var input = [
      '1',
      'snehil',
      'patna',
      '10',
      '10',
      '4',
      'A',
      'B',
      'C',
      'D',
      '4',
      '1',
      'ajay',
      'patna',
      '10',
      '10',
      '4',
      'A',
      'B',
      'C',
      'D',
      '4',
      '5'
    ].toList().iterator;

    Input.mock = () {
      if (input.moveNext()) return input.current;
      return "blank";
    };
    List<String> output = [];
    Log.mock = (Object? got) {
      output.add(got!.toString());
    };
    Looper().run();
    bool toTest = output.contains("Sucessfully added model to the storage.");
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
    Looper().run();
    bool toTest = output.contains("Deleted user having roll number - 10");
    expect(toTest, true);
  }, timeout: Timeout.parse("1s"));
}
