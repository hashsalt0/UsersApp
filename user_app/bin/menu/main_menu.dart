

import 'base/choice.dart';
import 'sub_menus/add_user_menu.dart';
import 'sub_menus/delete_user_menu.dart';
import 'sub_menus/display_user_menu.dart';
import 'sub_menus/exit_menu.dart';
import 'sub_menus/save_user_menu.dart';

class MainMenu extends Choice {
  bool isRunning = true;

  MainMenu() : super(''){
    addMenu(AddUserMenu());
    addMenu(DisplayUserMenu());
    addMenu(DeleteUserMenu());
    addMenu(SaveUserMenu());
    addMenu(ExitMenu(this));
  }

}