import 'package:greip/src/exceptions/custom_exception.dart';

class DomainNotWhitelistedException extends CustomException {
  DomainNotWhitelistedException()
      : super(113, 'domain_not_whitelisted', 'You are sending the request from a domain that is not the domain name you set in the API settings of your account�s dashboard.');
}
