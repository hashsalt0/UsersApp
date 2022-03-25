import 'package:dolumns/dolumns.dart';

import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../base/menu.dart';

class DisplayUserMenu extends Menu {
  DisplayUserMenu() : super(StringValues.displayUserMenuText);

  @override
  void execute() {
    /// printing user in the specified table format.
    String output = dolumnify([
      [
        StringValues.name,
        StringValues.rollNumber,
        StringValues.age,
        StringValues.address,
        StringValues.courses
      ],
      ...Store.instance.listOfUser().toList().map((e) => [
            e.fullName ?? "",
            e.rollNumber,
            e.age ?? "",
            e.address ?? "",
            e.courses
          ])
    ], headerIncluded: true, headerSeparator: '-');
    Log.verbose(output);
  }
}
