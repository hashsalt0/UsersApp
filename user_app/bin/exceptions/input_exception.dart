/// Basic Exception class on which other exception will inherit. It can be
/// utilized to error to the users that he entered is not accepted by the
/// system.
class InputException implements Exception {
  final String errorMessage;
  final String displayMessage;

  InputException(this.errorMessage, [this.displayMessage = ""]);

  @override
  String toString() {
    return "$runtimeType; $errorMessage";
  }
}
