import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:irrigation_app/pages/dashboard.dart';
import 'package:irrigation_app/pages/login.dart';
import 'package:irrigation_app/utils/preferences.dart';

class Initializer extends StatefulWidget {
  const Initializer({super.key});

  @override
  State<Initializer> createState() => _InitializerState();
}

class _InitializerState extends State<Initializer> {
  bool isNotFirstTime = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    final isLoggedInPref = await getIsLoggedIn('isLoggedIn');

    setState(() {
      isLoggedIn = isLoggedInPref ?? false;
    });

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const DashboardPage() : LoginPage();
  }
}
