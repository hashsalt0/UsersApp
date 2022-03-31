import 'menu/main_menu.dart';
import 'utils/logger.dart';
import 'utils/store.dart';

class UserAppLooper {
  UserAppLooper();
  /// executes the main menu indefinitely 
  void run() {
    Store.instance.loadStore();
    while (Store.instance.isRunning) {
      try {
        // Stupid mistake each time main menu was supposed to recreated.
        MainMenu mainMenu = MainMenu();
        mainMenu.execute();
      } catch (e, stackTrace) {
        Log.error("Fatal Error has occured");
        Log.error(e);
        Log.error(stackTrace);
      }
    }
  }
}
