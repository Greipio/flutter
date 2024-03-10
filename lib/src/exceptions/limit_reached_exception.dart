import 'package:greip/src/exceptions/custom_exception.dart';

class LimitReachedException extends CustomException {
  LimitReachedException()
      : super(103, 'limit_reached',
            'You reached the limit of your plan for this month. Please change your account�s plan or wait this month to end.');
}
