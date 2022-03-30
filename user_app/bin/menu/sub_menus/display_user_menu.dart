import 'package:dolumns/dolumns.dart';
import '../../model/user_model.dart';
import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../base/choice.dart';
import '../base/menu.dart';

class DisplayUserMenu extends Choice {
  late int Function({required UserModel a, required UserModel b}) compare;

  DisplayUserMenu() : super(StringValues.displayUserMenuText) {
    addMenu(DisplayMenuSortChoice(
        StringValues.name,
        ({required UserModel a, required UserModel b}) =>
            a.fullName?.compareTo(b.fullName ?? "") ?? 0,
        this));
    addMenu(DisplayMenuSortChoice(
        StringValues.rollNumber,
        ({required UserModel a, required UserModel b}) =>
            a.rollNumber.compareTo(b.rollNumber),
        this));
    addMenu(DisplayMenuSortChoice(
        StringValues.age,
        ({required UserModel a, required UserModel b}) =>
            a.age?.compareTo(b.age ?? 0) ?? 0,
        this));
    addMenu(DisplayMenuSortChoice(
        StringValues.address,
        ({required UserModel a, required UserModel b}) =>
            a.address?.compareTo(b.address ?? "") ?? 0,
        this));
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
      ...Store.instance.listOfUser(compare).map((e) => [
            e.fullName ?? "",
            e.rollNumber,
            e.age ?? "",
            e.address ?? "",
            e.courses.map((e) => e.name)
          ])
    ], headerIncluded: true, headerSeparator: '-');
    Log.verbose(output);
  }
}

class DisplayMenuSortChoice extends Choice {
  DisplayMenuSortChoice(
      String name,
      int Function({required UserModel a, required UserModel b}) ascendingCompare,
      DisplayUserMenu displayUserMenu)
      : super(name) {
    addMenu(DisplayMenuSortChoiceOrder(name: "Ascending", compare: ascendingCompare, displayUserMenu: displayUserMenu));
    addMenu(DisplayMenuSortChoiceOrder(
        name: "Descending",
        compare: ({required UserModel a, required UserModel b}) => -ascendingCompare(a: a, b: b),
        displayUserMenu: displayUserMenu));
  }
}

class DisplayMenuSortChoiceOrder extends Menu {

  int Function({required UserModel a, required UserModel b}) compare;
  DisplayUserMenu displayUserMenu;

  DisplayMenuSortChoiceOrder({required String name, required this.compare, required this.displayUserMenu})
      : super(name);

  @override
  void execute() {
    displayUserMenu.compare = compare;
  }
}
