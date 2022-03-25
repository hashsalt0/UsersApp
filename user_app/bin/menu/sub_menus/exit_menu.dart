import 'dart:io';

import '../../utils/logger.dart';
import '../../utils/string_values.dart';
import '../base/menu.dart';
import '../main_menu.dart';

class ExitMenu extends Menu {
  MainMenu mainMenu;
  ExitMenu(this.mainMenu) : super(StringValues.exitMenuText);

  @override
  void execute() {
    Log.info("Exiting application.... ");
    mainMenu.isRunning = false;
  }
}
