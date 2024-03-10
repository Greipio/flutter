import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidCountryCodeException extends CustomException {
  InvalidCountryCodeException()
      : super(116, 'invalid_country_code', 'The Country Code is invalid or not found.');
}
