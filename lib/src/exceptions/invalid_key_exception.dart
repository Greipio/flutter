import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidKeyException extends CustomException {
  InvalidKeyException()
      : super(101, 'invalid_key', 'The API Key is missing or invalid.');
}
