# Example

This example demonstrates how to use the Greip package in a Flutter application.

## Getting Started

1. Add the Greip package to your `pubspec.yaml` file:

   ```yaml
   dependencies:
     greip: ^1.1.0
   ```

2. Import the Greip package in your Dart code:

   ```dart
   import 'package:greip/greip.dart';
   ```

3. Import the Enums you need:

   ```dart
   import 'package:greip/src/enums/mode.dart';
   import 'package:greip/src/enums/param.dart';
   import 'package:greip/src/enums/language.dart';
   ```

4. Initialize the Greip package and use its functionalities:

   ```dart
   void main() {
     Greip greip = Greip();
     greip.setToken('your-greip-token');

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
   }
   ```

5. Run your Flutter application to see the package in action.

## Additional Information

- For detailed API documentation, refer to the [official API reference](https://docs.greip.io/).
- Check out the tests included in the package for usage examples.
