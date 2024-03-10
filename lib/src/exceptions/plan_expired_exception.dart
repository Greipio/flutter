import 'package:greip/src/exceptions/custom_exception.dart';

class PlanExpiredException extends CustomException {
  PlanExpiredException()
      : super(105, 'plan_expired',
            'Your plan has expired. Renew the subscription to enable using the API.');
}
