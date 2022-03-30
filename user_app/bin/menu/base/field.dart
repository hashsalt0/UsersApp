
abstract class Field<T> {
  final String name;
  // can be protected but no option in dart
  final String message;

  late T? value;

  Field(this.name, this.message);

  T? readValue();
}
