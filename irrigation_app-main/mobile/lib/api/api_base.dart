import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:irrigation_app/utils/constants.dart';
import 'package:irrigation_app/utils/custom_error.dart';

class ApiBaseHelper {
  final String _baseURL = appBaseURL;
  Future<dynamic> get(String url, Map<String, String> params) async {
    try {
      final response =
          await http.get(Uri.parse(_baseURL + url), headers: params);
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> post(String url, Map<String, String> params, Map body) async {
    try {
      final response = await http.post(Uri.parse(_baseURL + url),
          headers: params, body: jsonEncode(body));
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> uploadFile(String path, String url,
      Map<String, String> params, Map<String, String> body) async {
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      var headers = params;
      var fields = body;
      var file = await http.MultipartFile.fromPath('file', path);
      request.headers.addAll(headers);
      request.fields.addAll(fields);
      request.files.add(file);
      http.Response response =
          await http.Response.fromStream(await request.send());
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> put(String url, Map<String, String> params, Map body) async {
    try {
      final response = await http.put(Uri.parse(_baseURL + url),
          headers: params, body: jsonEncode(body));
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> patch(
      String url, Map<String, String> params, Map body) async {
    try {
      final response = await http.patch(Uri.parse(_baseURL + url),
          headers: params, body: jsonEncode(body));
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  Future<dynamic> delete(String url, Map<String, String> params) async {
    try {
      final response =
          await http.delete(Uri.parse(_baseURL + url), headers: params);
      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _handleResponse(http.Response response) {
    final responseJson = jsonDecode(response.body.toString());
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseJson;
    } else {
      _handleError(response.statusCode, responseJson);
    }
  }

  void _handleError(int statusCode, dynamic responseJson) {
    switch (statusCode) {
      case 400:
        throw BadRequestException(responseJson['message'].toString() != ''
            ? responseJson['message'].toString()
            : responseJson.toString());
      case 401:
        throw UnauthorisedException(responseJson['message'].toString() != ''
            ? responseJson['message'].toString()
            : responseJson.toString());
      case 403:
        throw UnauthorisedException(responseJson['message'].toString() != ''
            ? responseJson['message'].toString()
            : responseJson.toString());
      case 404:
        throw NotFoundException(responseJson.toString());
      case 409:
        throw UnauthorisedException(responseJson['message'].toString() != ''
            ? responseJson['message'].toString()
            : responseJson.toString());
      case 408:
        throw RequestTimeoutException(responseJson.toString());
      case 500:
        throw InternalServerErrorException(responseJson.toString());
      case 503:
        throw ServiceUnavailableException(responseJson.toString());
      default:
        throw FetchDataException('Error occurred with StatusCode: $statusCode');
    }
  }
}
