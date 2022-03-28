import 'dart:html';

import 'package:dolumns/dolumns.dart';

import '../../model/user_model.dart';
import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../base/choice.dart';
import '../base/menu.dart';

class DisplayUserMenu extends Choice {
  late int Function(UserModel a, UserModel b) compare;

  DisplayUserMenu() : super(StringValues.displayUserMenuText) {
    addMenu(DisplayMenuSortChoice(StringValues.name,
        (a, b) => a.fullName!.compareTo(b.fullName ?? ""), this));
    addMenu(DisplayMenuSortChoice(StringValues.rollNumber,
        (a, b) => a.rollNumber.compareTo(b.rollNumber), this));
    addMenu(DisplayMenuSortChoice(
        StringValues.age, (a, b) => a.age!.compareTo(b.age ?? 0), this));
    addMenu(DisplayMenuSortChoice(StringValues.address,
        (a, b) => a.address!.compareTo(b.address ?? ""), this));
  }

  @override
  void execute() {
    Log.info("Sort users by ::");
    super.execute();

    /// printing user in the specified table format.
    String output = dolumnify([
      [
        StringValues.name,
        StringValues.rollNumber,
        StringValues.age,
        StringValues.address,
        StringValues.courses
      ],
      ...Store.instance.listOfUser(compare).toList().map((e) => [
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

class DisplayMenuSortChoice extends Choice {
  DisplayMenuSortChoice(
      String name,
      int Function(UserModel a, UserModel b) compare,
      DisplayUserMenu displayUserMenu)
      : super(name) {
    addMenu(DisplayMenuSortChoiceOrder("Ascending", compare, displayUserMenu));
    addMenu(DisplayMenuSortChoiceOrder(
        "Descending", (a, b) => -compare(a, b), displayUserMenu));
  }
  
}

class DisplayMenuSortChoiceOrder extends Menu {
  int Function(UserModel a, UserModel b) compare;
  DisplayUserMenu displayUserMenu;

  DisplayMenuSortChoiceOrder(String name, this.compare, this.displayUserMenu)
      : super(name);

  @override
  void execute() {
    displayUserMenu.compare = compare;
  }
}
