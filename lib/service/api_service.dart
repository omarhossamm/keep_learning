import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:keep_learning/app_constants.dart';

class ApiService {
  Future<Map<String, dynamic>> fetchData(String endPoint) async {
    bool internetAvailable = await _checkInternetConnectivity();
    if (internetAvailable) {
      final response = await get(
        Uri.parse(baseUrl + endPoint),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw _handleError(response.statusCode);
      }
    } else {
      throw noInternetConnectionError;
    }
  }

  Future<bool> _checkInternetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  String _handleError(int statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Unexpected error occurred';
    }
  }
}
