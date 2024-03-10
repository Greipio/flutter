import 'dart:convert';

import 'package:greip/src/helpers/exception_handler.dart';
import 'package:http/http.dart' as http;

class APIService {
  static APIService? _instance;

  static APIService get instance => _instance ??= APIService._();

  APIService._();

  Future<Map<String, dynamic>> getMethod(
      {required Uri uri,
      required String token,
      Map<String, dynamic>? query}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.get(
      uri.replace(queryParameters: query),
      headers: headers,
    );
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      return decodedResponse;
    } else {
      if (decodedResponse.containsKey("code")) {
        throw ExceptionHandler.exceptionByCode(decodedResponse['code']);
      }

      return Future.error(decodedResponse);
    }
  }

  Future<Map<String, dynamic>> postMethod(
      {required Uri uri,
      required String token,
      Map<String, dynamic>? data,
      Map<String, dynamic>? query}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(data),
    );
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200 && decodedResponse['status'] == 'success') {
      return decodedResponse;
    } else {
      if (decodedResponse.containsKey("code")) {
        throw ExceptionHandler.exceptionByCode(decodedResponse['code']);
      }

      return Future.error(decodedResponse);
    }
  }
}
