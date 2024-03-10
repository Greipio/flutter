import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidAsnException extends CustomException {
  InvalidAsnException()
      : super(121, 'invalid_asn', 'The AS Number you provided is empty or invalid.');
}
