import 'package:greip/src/exceptions/custom_exception.dart';

class InvalidParamsException extends CustomException {
  InvalidParamsException()
      : super(104, 'invalid_params', 'Please check out the parms parameter�s value.');
}
