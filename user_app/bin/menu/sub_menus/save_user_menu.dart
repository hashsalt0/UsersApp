
import '../../utils/logger.dart';
import '../../utils/store.dart';
import '../../utils/string_values.dart';
import '../base/menu.dart';

class SaveUserMenu extends Menu {
  SaveUserMenu() : super(StringValues.saveUserMenuText);

  @override
  void execute() {
    Store.instance.saveStore();
    Log.help("Sucessfully saved store to disk.");
  }
}