import 'package:flutter_test/flutter_test.dart';
import 'package:greip/greip.dart';
import 'package:greip/src/enums/mode.dart';
import 'package:greip/src/enums/param.dart';

void main() {
  group('Greip Package Tests', () {
    late Greip greip;

    setUp(() {
      greip = Greip();
      greip.setToken('your-api-token');
    });

    test('Free-IP Test', () async {
      final result = await greip.ip();
      expect(result['status'], equals('success'));
    });

    test('Email Validation Test', () async {
      final result = await greip.validateEmail('name@domain.com');
      expect(result['status'], equals('success'));
    });

    test('IP Geolocation Test', () async {
      final result = await greip.geoIp();
      expect(result['status'], equals('success'));
    });

    test('Phone Validation Test', () async {
      final result = await greip.validatePhone('1234567890', 'TR');
      expect(result['status'], equals('success'));
    });

    test('IBAN Validation Test', () async {
      final result = await greip.validateIban('DE89370400440532013000');
      expect(result['status'], equals('success'));
    });

    test('Profanity Detection Test', () async {
      final result = await greip.profanity('This is a test message');
      expect(result['status'], equals('success'));
    });

    test('Payment Fraud Prevention Test', () async {
      Map<String, dynamic> data = {
        "action": 'purchase',
        "website_domain": 'greip.io',
        'website_name': 'Greip',
        "merchant_id": 12,
        'shipment_id': 123,
        'transaction_id': 1234,
        'transaction_amount': 1000,
        'transaction_currency': 'GBP',
        'cart_items': {
          'item_id': 1,
          'item_name': 'Product name',
          'item_quantity': 1,
          'item_price': '1100.55',
          'item_category_id': 1,
        },
        'isDigitalProducts': true,
        'coupon': 'ASDF',
        'customer_id': 1,
        'customer_firstname': 'Firstname',
        'customer_lastname': 'Lastname',
        'customer_pob': 'London',
        'customer_ip': '1.1.1.1',
        'customer_country': 'GB',
        'customer_region': 'London',
        'customer_city': 'London',
        'customer_zip': 'NW10 7PQ',
        'customer_street': '7 Coronation Road',
        'customer_street2': '',
        'customer_latitude': 0.123,
        'customer_longitude': 0.123,
        'customer_device_id': 'UNIQUE_DEVICE_ID',
        "customer_phone": '000000000',
        "customer_registration_date": 1677554670,
        "customer_balance": '1000.00',
        "customer_dob": '1997-19-05',
        "customer_email": 'name@domain.com',
        "customer_2fa": true,
        "customer_useragent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36',
        "shipping_country": 'GB',
        "shipping_region": 'London',
        "shipping_city": 'London',
        "shipping_zip": 'NW10 7PQ',
        "shipping_street": '7 Coronation Road',
        "shipping_street2": '',
        "shipping_latitude": 0.123,
        "shipping_longitude": 0.123,
        "billing_country": 'GB',
        "billing_region": 'London',
        "billing_city": 'London',
        "billing_zip": 'NW10 7PQ',
        "billing_street": '7 Coronation Road',
        "billing_street2": '',
        "billing_latitude": 0.123,
        "billing_longitude": 0.123,
        "payment_type": 'applepay',
        "card_name": 'Firstname Lastname',
        "card_number": '1234XXXXXXXX1234',
        "card_expiry": '29/05',
        "cvv_result": true,
      };
      final result = await greip.paymentFraud(data , mode: Mode.live);
      expect(result['status'], equals('success'));
    });

    test('Country Lookup Test', () async {
      final result = await greip.countryLookup('PS');
      expect(result['status'], equals('success'));
    });

    test('ASN Lookup Test', () async {
      final result = await greip.asnLookup('AS12345');
      expect(result['status'], equals('success'));
    });

    test('IP Lookup Test', () async {
      final result = await greip.ipLookup("1.1.1.1" , params: [
        Param.security,
        Param.currency,
        Param.timezone,
        Param.location,
      ]);
      expect(result['status'], equals('success'));
    });

    test('Bulk IP Lookup Test', () async {
      final result = await greip.bulkLookup(["1.1.1.1" , "2.2.2.2"]);
      expect(result['status'], equals('success'));
    });
  });
}
