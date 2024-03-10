import 'package:greip/src/exceptions/custom_exception.dart';

class SecurityModuleNotAllowedException extends CustomException {
  SecurityModuleNotAllowedException()
      : super(114, 'security_module_not_allowed', 'You cannot use the security module in the free plan. Please upgrade your API plan to unlock this feature.');
}
