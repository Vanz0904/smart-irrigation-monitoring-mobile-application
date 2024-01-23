import 'package:irrigation_app/api/api_base.dart';

class UserService {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final baseURL = "/";

  Future<dynamic> login(Map body) async {
    const url = '';

    final response = await _helper.post(
        baseURL + url, {'content-Type': 'application/json'}, body);
    final data = response;
    return data;
  }

  Future<dynamic> register(Map body) async {
    const url = '/register';

    final response = await _helper.post(
        baseURL + url, {'content-Type': 'application/json'}, body);
    final data = response;
    return data;
  }
}
