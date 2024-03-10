import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidIbanException extends CustomException {
  InvalidIbanException()
      : super(122, 'invalid_iban', 'The IBAN is invalid or missing.');
}
