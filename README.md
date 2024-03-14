# Greip Flutter Package

This Flutter package provides a convenient way to interact with the [Greip API](https://docs.greip.io). It allows you to easily integrate Greip's fraud prevention & IP geolocation services into your application, and performing actions like IP Lookup, Email Validation, Phone Number Validation, ASN Lookup, BIN Lookup, and much more.

[Report Issue](https://github.com/Greipio/flutter/issues/new)
·
[Request Feature](https://github.com/Greipio/flutter/discussions/new?category=ideas)
·
[Greip Website](https://greip.io/)
·
[Documentation](https://docs.greip.io/)

[![Flutter Package](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://pub.dev/packages/greip)
[![Github Repository](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Greipio/flutter)

![Pub Version](https://img.shields.io/pub/v/greip)
&nbsp;
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/Greipio/flutter?color=green&label=Minified%20size&logo=github)
&nbsp;
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/license/apache-2-0)
&nbsp;
![API Status](https://img.shields.io/website?down_color=orange&down_message=down&label=API%20status&up_color=green&up_message=up&url=https%3A%2F%2Fgreipapi.com)

---

## Installation

To use the package in your Flutter project, just add it as a dependency in your `pubspec.yaml` file as follows:

```yaml
dependencies:
  greip: ^1.1.0
```

Then, run the following command to install the package:

```dart
flutter pub get
```

## Usage

Here's how you can use the Greip SDK in your Flutter project:

### Importing the package

```dart
import 'package:greip/greip.dart';
```

### Initializing the Greip object

```dart
Greip greip = Greip();
```

### Setting API Token

Before making any API requests, you need to set your API token (API Key) using the `setToken` method:

```dart
greip.setToken('your-greip-token');
```

Replace `your-greip-token` with your actual [Greip API key](https://docs.greip.io/dashboard-guides/account-management/obtaining-api-key).

That's it 🥳, now you're ready to start using the package methods.

## Methods

### 1. IP Geolocation Method

Use this method to retrieve the IP address of the visitor/user with its full information.

```dart
import 'package:greip/src/enums/mode.dart';
import 'package:greip/src/enums/param.dart';
import 'package:greip/src/enums/language.dart';

try {
  Map<String, dynamic> result = await greip.geoIp(params: [
    Param.security,
    Param.currency,
    Param.timezone,
    Param.location,
  ], lang: Language.en, mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 2. IP Lookup Method

Use this method to retrieve the information of a given IP address.

```dart
import 'package:greip/src/enums/mode.dart';
import 'package:greip/src/enums/param.dart';
import 'package:greip/src/enums/language.dart';

try {
  Map<String, dynamic> result = await greip.ipLookup('1.1.1.1', params: [
    Param.security,
    Param.currency,
    Param.timezone,
    Param.location,
  ], lang: Language.en, mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 3. Free Get-IP Method

This method can be used without having an account/API-key in [Greip](https://greip.io). Please feel free to use it if you want to get **ONLY** the IP Address of your visitors/users.

```dart
try {
  Map<String, dynamic> result = await greip.ip();
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 4. Bulk IP Lookup Method

You can use this method to retrieve the information of multiple IP addresses (no need to use the `ipLookup` emthod inside a loop).

```dart
import 'package:greip/src/enums/mode.dart';
import 'package:greip/src/enums/param.dart';
import 'package:greip/src/enums/language.dart';

try {
  List<String> ips = ['1.1.1.1', '2.2.2.2'];
  Map<String, dynamic> result = await greip.bulkLookup(ips, params: [
    Param.security,
    Param.currency,
    Param.timezone,
    Param.location,
  ], lang: Language.en, mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 5. ASN Lookup Method

In this method, Greip will help you lookup any given AS Number and returning all data related to it, like: name, org (the organization name), country, domain, email, phone, totalIPs, list of all routes (v4 & v6) related the given AS Number, etc.

```dart
import 'package:greip/src/enums/mode.dart';

try {
  Map<String, dynamic> result = await greip.asnLookup('AS01', mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 6. Profanity Detection Method

This method can be used to detect abuse of your website/app. It’s a great way to know more about your user inputs and whether they contain profanity (bad words) or not before releasing them to the public.

```dart
import 'package:greip/src/enums/mode.dart';

try {
  Map<String, dynamic> result = await greip.profanity('This is just a text with no profanity.', mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 7. Country Lookup Method

This method can help you retrieve information of the given country.

```dart
import 'package:greip/src/enums/mode.dart';
import 'package:greip/src/enums/language.dart';

try {
  Map<String, dynamic> result = await greip.countryLookup('SA', lang: Language.en, mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 8. Email Validation Method

This method provides an additional layer of validation for your system. While validating email syntax is important, it is not sufficient.

This method goes beyond syntax validation by checking the domain’s validity, the availability of the Mail Service, detecting Disposable Email (Temporary Emails), etc. By utilising this method, you can ensure a more thorough validation process for email addresses.

```dart
import 'package:greip/src/enums/mode.dart';

try {
  Map<String, dynamic> result = await greip.validateEmail('name@domain.com', mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 9. Phone Validation Method

This method can be used as an extra-layer of your system for validating phone numbers. It validates phone number syntax and valid-possibility.

```dart
import 'package:greip/src/enums/mode.dart';

try {
  Map<String, dynamic> result = await greip.validatePhone('01234567890', 'TR', mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 10. Payment Fraud Prevention Method

Prevent financial losses by deploying AI-Powered modules.

```dart
import 'package:greip/src/enums/mode.dart';

try {
  Map<String, dynamic> data = {
    action: 'purchase',
    website_domain: 'greip.io',
    website_name: 'Greip',
    merchant_id: 12,
    shipment_id: 123,
    transaction_id: 1234,
    transaction_amount: 1000,
    transaction_currency: 'GBP',
    cart_items: {
      item_id: 1,
      item_name: 'Product name',
      item_quantity: 1,
      item_price: '1100.55',
      item_category_id: 1,
    },
    isDigitalProducts: true,
    coupon: 'ASDF',
    customer_id: 1,
    customer_firstname: 'Firstname',
    customer_lastname: 'Lastname',
    customer_pob: 'London',
    customer_ip: '1.1.1.1',
    customer_country: 'GB',
    customer_region: 'Greater London',
    customer_city: 'London',
    customer_zip: 'NW10 7PQ',
    customer_street: '7 Coronation Road',
    customer_street2: '',
    customer_latitude: 0.123,
    customer_longitude: 0.123,
    customer_device_id: 'UNIQUE_DEVICE_ID',
    customer_phone: '000000000',
    customer_registration_date: 1677554670,
    customer_balance: '1000.00',
    customer_dob: '1997-19-05',
    customer_email: 'name@domain.com',
    customer_2fa: true,
    customer_useragent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
    shipping_country: 'GB',
    shipping_region: 'London',
    shipping_city: 'London',
    shipping_zip: 'NW10 7PQ',
    shipping_street: '7 Coronation Road',
    shipping_street2: '',
    shipping_latitude: 0.123,
    shipping_longitude: 0.123,
    billing_country: 'GB',
    billing_region: 'Greater London',
    billing_city: 'London',
    billing_zip: 'NW10 7PQ',
    billing_street: '7 Coronation Road',
    billing_street2: '',
    billing_latitude: 0.123,
    billing_longitude: 0.123,
    payment_type: 'applepay',
    card_name: 'Firstname Lastname',
    card_number: '1234XXXXXXXX1234',
    card_expiry: '29/05',
    cvv_result: true,
  };
  Map<String, dynamic> result = await greip.paymentFraud(data, mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

### 11. IBAN Validation Method

This method allows you to validate International Bank Account Numbers (IBANs) and retrieve additional information about the country associated with the IBAN.

```dart
import 'package:greip/src/enums/mode.dart';

try {
  Map<String, dynamic> result = await greip.validateIban('DE89370400440532013000', mode: Mode.live);
  print(result);
} catch (e) {
  print('Error: $e');
}
```

## Options, Methods and More

You can find the full guide of this package by visiting our [documentation page](https://docs.greip.io/).

## Credits

- [Greip Developers](https://greip.io)
- [All Contributors](https://github.com/Greipio/flutter/graphs/contributors)

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, feel free to open an issue or create a pull request.
