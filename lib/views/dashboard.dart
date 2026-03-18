import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text(
          "Game Hub",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,

          children: [
            dashboardCard(
              icon: Icons.gamepad,
              title: "Play",
              color: Colors.blueAccent,
              onTap: () => Get.toNamed("/play"),
            ),

            dashboardCard(
              icon: Icons.newspaper_outlined,
              title: "News",
              color: Colors.blueAccent,
              onTap: () => Get.toNamed("/news"),
            ),

            dashboardCard(
              icon: Icons.store,
              title: "Store",
              color: Colors.blueAccent,
              onTap: () => Get.toNamed("/store"),
            ),

            dashboardCard(
              icon: Icons.library_add_check,
              title: "Library",
              color: Colors.blueAccent,
              onTap: () => Get.toNamed("/library"),
            ),

            dashboardCard(
              icon: Icons.person,
              title: "Profile",
              color: Colors.blueAccent,
              onTap: () => Get.toNamed("/profile"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget dashboardCard({
  required IconData icon,
  required String title,
  required Color color,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,

    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.black),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
