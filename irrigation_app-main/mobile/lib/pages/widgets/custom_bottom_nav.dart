import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      unselectedItemColor: Colors.white,
      selectedItemColor: const Color.fromRGBO(139, 195, 74, 1),
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontSize: 9),
      unselectedLabelStyle: const TextStyle(fontSize: 9),
      onTap: onTap,
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
    );
  }
}
