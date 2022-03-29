import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../base/menu.dart';

class ExitMenu extends Menu {
  ExitMenu() : super(StringValues.exitMenuText);

  @override
  void execute() {
    Log.info("Exiting application.... ");
    Store.instance.isRunning = false;
  }
}
