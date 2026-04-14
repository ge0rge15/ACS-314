import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Homescreen> {
  int _page = 0;

  final List<String> titles = ["Play", "News", "Store", "Library", "Profile"];

  final List<Widget> pages = [
    ListView(
      padding: EdgeInsets.all(16),
      children: const [
        Text(
          "Recently Played",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("Call of Duty"),
          subtitle: Text("Last played: Today"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("FIFA 24"),
          subtitle: Text("Last played: Yesterday"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("Apex Legends"),
          subtitle: Text("Last played: 2 days ago"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("Fortnite"),
          subtitle: Text("Last played: 3 days ago"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("FC 26"),
          subtitle: Text("Last played: Yesterday"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("RED DEAD REDEMPTION II"),
          subtitle: Text("Last played: A week ago"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("Horizon Zero Dawn"),
          subtitle: Text("Last played: A month ago"),
        ),
        ListTile(
          leading: Icon(Icons.sports_esports),
          title: Text("THE LAST OF US PART II"),
          subtitle: Text("Last played: A month ago"),
        ),
      ],
    ),

    ListView(
      padding: EdgeInsets.all(16),
      children: const [
        Text(
          "Official News",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.article),
          title: Text("New Game Update Released"),
          subtitle: Text("Version 2.0 now available"),
        ),
        ListTile(
          leading: Icon(Icons.article),
          title: Text("Upcoming Tournament"),
          subtitle: Text("Join now and win prizes"),
        ),
      ],
    ),

    GridView.count(
      padding: EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        gameCard("assets/game 1.png", "RED DEAD REDEMPTION II"),
        gameCard("assets/game 2.png", "GTA VI"),
        gameCard("assets/game 3.png", "THE LAST OF US PART II"),
        gameCard("assets/game 4.png", "MORTAL 1 KOMBAT"),
        gameCard("assets/game 5.png", "FC 26"),
        gameCard("assets/game 6.png", "APEX LEGENDS"),
        gameCard("assets/game 7.png", "HORIZON ZERO DAWN"),
        gameCard("assets/game 8.png", "GOD OF WAR RAGNAROK"),
      ],
    ),

    ListView(
      padding: EdgeInsets.all(16),
      children: const [
        Text(
          "Games",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.videogame_asset),
          title: Text("Minecraft"),
        ),
        ListTile(leading: Icon(Icons.videogame_asset), title: Text("GTA V")),
      ],
    ),

    // PROFILE PAGE
    ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),

        SizedBox(height: 10),

        Center(
          child: Text(
            "Username",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(height: 20),

        Divider(),

        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text("Accessibility"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),

        ListTile(
          leading: Icon(Icons.people),
          title: Text("Users and Accounts"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),

        ListTile(
          leading: Icon(Icons.family_restroom),
          title: Text("Family and Parental Controls"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),

        ListTile(
          leading: Icon(Icons.storage),
          title: Text("System and Storage"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ],
    ),
  ];

  void logout() {
    Get.dialog(
      AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Get.offAllNamed("/login");
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_page]),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: logout,
          ),
        ],
      ),

      body: pages[_page],

      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        backgroundColor: Colors.white,
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.blueAccent,
        items: const [
          Icon(Icons.sports_esports, size: 30),
          Icon(Icons.newspaper_outlined, size: 30),
          Icon(Icons.store, size: 30),
          Icon(Icons.library_add_check, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

Widget gameCard(String imagePath, String title) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 50, color: Colors.grey),
            );
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            color: Colors.black.withOpacity(0.6),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ),
  );
}
