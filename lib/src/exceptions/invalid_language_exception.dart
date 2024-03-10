import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidLanguageException extends CustomException {
  InvalidLanguageException()
      : super(110, 'invalid_language', 'The value of the lang parameter is not a valid format. Use EN, AR, FR, DE, ES, JA, ZH or RU.');
}
