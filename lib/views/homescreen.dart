import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.blueAccent,
        items: const [
          Icon(Icons.gamepad, size: 30),
          Icon(Icons.newspaper_outlined, size: 30),
          Icon(Icons.store, size: 30),
          Icon(Icons.library_add_check, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          // Handle button tap
        },
      ),
    );
  }
}
