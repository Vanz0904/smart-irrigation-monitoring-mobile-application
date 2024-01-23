import 'package:irrigation_app/api/api_base.dart';

class SensorDataService {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final baseURL = "/";

  Future<dynamic> get() async {
    const url = '';

    final response = await _helper.get(
        baseURL + url, {'content-Type': 'application/json'});
    final data = response;
    return data;
  }
}
