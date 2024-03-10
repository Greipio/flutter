// Create a custom exception class for your application
class CustomException implements Exception {
  final int code;
  final String type;
  final String description;

  CustomException(this.code, this.type, this.description);

  @override
  String toString() {
    return 'CustomException (Code: $code, Type: $type): $description';
  }
}
