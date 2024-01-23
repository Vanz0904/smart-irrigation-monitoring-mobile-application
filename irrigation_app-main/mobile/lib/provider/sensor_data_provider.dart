import 'package:get/get.dart';
import 'package:irrigation_app/model/sensor_data_model.dart';
import 'package:irrigation_app/services/sensor_data_service.dart';

class SensorDataController extends GetxController {
  final SensorDataService _sensordataService =
      SensorDataService();
  final RxList<SensorData> sensordata = <SensorData>[].obs;
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    try {
      isLoading.value = true;
      final res = await _sensordataService.get();
      final data = res;

      List<SensorData> dataRes = data.map((item) => SensorData.fromJson(item)).toList();

      sensordata.value = dataRes;
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
