import 'menu/main_menu.dart';
import 'utils/logger.dart';
import 'utils/store.dart';

class Looper {
  Looper();
  /// executes the main menu indefinitely 
  void run() {
    MainMenu mainMenu = MainMenu();
    Store.instance.loadStore();
    while (mainMenu.isRunning) {
      try {
        mainMenu.execute();
      } catch (e, stackTrace) {
        Log.error("Fatal Error has occured");
        Log.error(e);
        Log.error(stackTrace);
      }
    }
  }
}
