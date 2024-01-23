import 'package:flutter/material.dart';
import 'package:irrigation_app/pages/home.dart';
import 'package:irrigation_app/pages/reports.dart';
import 'package:irrigation_app/pages/schedule.dart';
import 'package:irrigation_app/pages/users.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SchedulePage(),
    ReportsPage(),
    UsersPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 23, 23, 23),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromRGBO(139, 195, 74, 1),
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 9),
        unselectedLabelStyle: const TextStyle(fontSize: 9),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-home-48.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-timetable-50.png'),
            ),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-project-50.png'),
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/icons8-users-50.png'),
            ),
            label: 'Users',
          ),
        ],
      ),
    );
  }
}
