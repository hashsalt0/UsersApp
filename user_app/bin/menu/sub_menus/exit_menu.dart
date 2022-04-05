import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../base/choice.dart';
import '../base/menu.dart';

class ExitMenu extends Choice {
  ExitMenu() : super(StringValues.exitMenuText){
    addMenu(YesMenu());
    addMenu(NoMenu());
  }

  @override
  void execute() {  
    Log.info("Do you want to save the file");
    super.execute();
    Log.info("Exiting application.... ");
    Store.instance.isRunning = false;
  }
}


class YesMenu extends Menu {
  YesMenu() : super("Yes");

  @override
  void execute() {
    Store.instance.saveStore();
  }
}
class NoMenu extends Menu {
  NoMenu() : super("No");

  @override
  void execute(){}
}