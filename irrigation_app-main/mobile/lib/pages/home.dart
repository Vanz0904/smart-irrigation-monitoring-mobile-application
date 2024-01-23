import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irrigation_app/pages/widgets/avatar_widget.dart';
import 'package:irrigation_app/pages/widgets/custom_guage.dart';
import 'package:irrigation_app/pages/widgets/weather_widget.dart';
import 'package:irrigation_app/provider/sensor_data_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  final SensorDataController _sensordataController = Get.put(SensorDataController());

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Avatar(),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // Handle notification button press
                            },
                            icon: Image.asset(
                              'assets/icons/icons8-logout-50.png',
                              width: 24,
                              height: 24,
                              color: Colors.grey[500],
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const WeatherCard(),
                const SizedBox(height: 8),
                Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        padding: const EdgeInsets.all(2),
                        children: [
                          Container(
                            child: const CustomGaugeContainer(
                              alertSpeedArray: [8, 18, 27, 30],
                              alertColorArray: [
                                Colors.red,
                                Colors.orange,
                                Colors.lightBlueAccent,
                                Colors.green,
                              ],
                              unitOfMeasurement: "Liters",
                              iconpath: 'assets/icons/icons8-water-48.png',
                              amount: "5",
                              speed: 28,
                              mesurement: "Water Level",
                            ),
                          ),
                          Container(
                            child: const CustomGaugeContainer(
                              alertSpeedArray: [8, 18, 27, 30],
                              alertColorArray: [
                                Colors.red,
                                Colors.orange,
                                Colors.lightBlueAccent,
                                Colors.green,
                              ],
                              unitOfMeasurement: "Celcius",
                              iconpath: 'assets/icons/icons8-thermometer-48 (1).png',
                              amount: "24",
                              speed: 22,
                              mesurement: "Temperature",
                            ),
                          ),
                          Container(
                            child: const CustomGaugeContainer(
                              alertSpeedArray: [8, 18, 27, 30],
                              alertColorArray: [
                                Colors.red,
                                Colors.orange,
                                Colors.lightBlueAccent,
                                Colors.green,
                              ],
                              unitOfMeasurement: "hu",
                              iconpath: 'assets/icons/icons8-humidity-48.png',
                              amount: "500",
                              speed: 64,
                              mesurement: "Humidity",
                            ),
                          ),
                          Container(
                            child: const CustomGaugeContainer(
                              alertSpeedArray: [8, 18, 27, 30],
                              alertColorArray: [
                                Colors.red,
                                Colors.orange,
                                Colors.lightBlueAccent,
                                Colors.green,
                              ],
                              unitOfMeasurement: "m",
                              iconpath: 'assets/icons/icons8-hygrometer-48.png',
                              amount: "100",
                              speed: 92,
                              mesurement: "Moisture",
                            ),
                          )
                        ]),
                  ),]))
      ),
      );
      
  }
}
