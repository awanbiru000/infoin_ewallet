import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({super.key, 
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Pesan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
