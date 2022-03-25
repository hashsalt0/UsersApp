import 'log_colors.dart';

/// Log class helpful for debugging purposes
class Log {
  static Function(Object? text)? mock;

  static void _printHelp(Object? text){
    if(mock != null){
        mock!(text);
    }else{
      print(text);
    }
  }

  static void error(Object? text) {
    _printHelp("${LogColors.red}$text${LogColors.reset}");
  }

  static void info(Object? text) {
    _printHelp("${LogColors.white}$text${LogColors.reset}");
  }

  static void verbose(Object? text) {
    _printHelp("${LogColors.green}$text${LogColors.reset}");
  }

  static void debug(Object? text) {
    _printHelp("${LogColors.cyan}$text${LogColors.reset}");
  }

  static void help(Object? text) {
    _printHelp("${LogColors.yellow}$text${LogColors.reset}");
  }
}
