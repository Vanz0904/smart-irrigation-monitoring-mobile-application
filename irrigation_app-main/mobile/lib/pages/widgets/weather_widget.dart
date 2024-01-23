import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  final String apiKey = '79135620a6a24c59af1185843232306';
  Map<String, dynamic> weatherData = {};
  String locationName = '';

  @override
  void initState() {
    super.initState();
    // Request location permission when the widget initializes
    requestLocationPermission();
  }

  // Future<String?> getaddresss(double lat, double long) async {
  //   final coordinates = new Coordinates(lat, long);
  //   var address =
  //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   var first = address.first;
  //   setState(() {
  //     stAddress1 = first.subLocality!;
  //   });
  //   return first.addressLine;
  // }

  Future<void> fetchWeatherData() async {
    try {
      // Get user's current location
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      final double latitude = position.latitude;
      final double longitude = position.longitude;

      // Fetch weather data based on coordinates
      final Uri apiUrl = Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude');

      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          weatherData = data;
        });
      } else {
        throw Exception('Failed to load weather data');
      }

      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      setState(() {
        locationName = '${place.street}, ${place.locality}, ${place.country}';
      });
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      // Location permission granted, you can now fetch weather data.
      fetchWeatherData();
    } else {
      // Handle the case when permission is denied.
      // You can show a message or request the permission again.
      Get.snackbar('Info', "Location permission denied",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  Widget build(BuildContext context) {
    final conditionText =
        weatherData['current']?['condition']?['text'] ?? 'Loading';
    final temperature = weatherData['current']?['temp_c'] ?? 0;

    final size = MediaQuery.of(context).size;
    return Card(
      color: const Color.fromRGBO(53, 53, 55, 1),
      surfaceTintColor: const Color.fromRGBO(53, 53, 55, 1),
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        conditionText,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        '$temperature°C',
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        locationName,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Image.asset(
                  'assets/images/weather.png',
                  width: 100,
                  height: 100,
                  // color: Colors.yellowAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
