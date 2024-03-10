import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidIpException extends CustomException {
  InvalidIpException()
      : super(112, 'invalid_ip', 'The IP Address is not valid or empty.');
}
