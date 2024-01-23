import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:irrigation_app/initializer.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(0, 255, 255, 255),
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Color.fromARGB(255, 23, 23, 23),
      systemNavigationBarIconBrightness: Brightness.dark));

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(GetMaterialApp(
    theme: ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(139, 195, 74, 1),
        background: const Color.fromARGB(255, 23, 23, 23),
      ),
      useMaterial3: true,
    ),
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(139, 195, 74, 1),
          background: const Color.fromARGB(255, 23, 23, 23),
        ),
        useMaterial3: true,
      ),
      home: const Initializer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
