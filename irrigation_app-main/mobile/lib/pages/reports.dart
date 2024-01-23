import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  ReportsPage({super.key});
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 23, 23, 23),
          title: const Text('Reports'),
        ),
        
      body: const Center(child: Text('No reports available',style: TextStyle(color: Colors.white),)));}}