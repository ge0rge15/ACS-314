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

  // Game data for store section
  final List<Map<String, dynamic>> storeGames = [
    {
      "path": "assets/game 1.png",
      "title": "RED DEAD REDEMPTION II",
      "releaseDate": "October 26, 2018",
      "size": "150 GB",
      "amount": "\$59.99",
    },
    {
      "path": "assets/game 2.png",
      "title": "GTA VI",
      "releaseDate": "Coming 2025",
      "size": "TBD",
      "amount": "\$69.99",
    },
    {
      "path": "assets/game 3.png",
      "title": "THE LAST OF US PART II",
      "releaseDate": "June 19, 2020",
      "size": "78 GB",
      "amount": "\$49.99",
    },
    {
      "path": "assets/game 4.png",
      "title": "MORTAL 1 KOMBAT",
      "releaseDate": "September 19, 2023",
      "size": "120 GB",
      "amount": "\$69.99",
    },
    {
      "path": "assets/game 5.png",
      "title": "FC 26",
      "releaseDate": "September 2025",
      "size": "65 GB",
      "amount": "\$59.99",
    },
    {
      "path": "assets/game 6.png",
      "title": "APEX LEGENDS",
      "releaseDate": "February 4, 2019",
      "size": "56 GB",
      "amount": "Free",
    },
    {
      "path": "assets/game 7.png",
      "title": "HORIZON ZERO DAWN",
      "releaseDate": "February 28, 2017",
      "size": "48 GB",
      "amount": "\$39.99",
    },
    {
      "path": "assets/game 8.png",
      "title": "GOD OF WAR RAGNAROK",
      "releaseDate": "November 9, 2022",
      "size": "90 GB",
      "amount": "\$69.99",
    },
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

  void _showGameDetailsDialog(
    String title,
    String releaseDate,
    String size,
    String amount,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 20,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(width: 10),
                  Text("Release Date: $releaseDate"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.storage, size: 20, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text("Size: $size"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.attach_money, size: 20, color: Colors.blueAccent),
                  SizedBox(width: 10),
                  Text("Price: $amount"),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        children: List.generate(storeGames.length, (index) {
          final game = storeGames[index];
          return GestureDetector(
            onTap: () {
              _showGameDetailsDialog(
                game["title"],
                game["releaseDate"],
                game["size"],
                game["amount"],
              );
            },
            child: gameCard(game["path"], game["title"]),
          );
        }),
      ),

      ListView(
        padding: EdgeInsets.all(16),
        children: const [
          Text(
            "Games",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text("MINECRAFT"),
          ),
          ListTile(leading: Icon(Icons.videogame_asset), title: Text("GTA V")),
          ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text("FORTNITE"),
          ),
          ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text("CALL OF DUTY"),
          ),
          ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text("APEX LEGENDS"),
          ),
          ListTile(leading: Icon(Icons.videogame_asset), title: Text("MK 11")),
          ListTile(
            leading: Icon(Icons.videogame_asset),
            title: Text("INJUSTICE 2"),
          ),
          ListTile(leading: Icon(Icons.videogame_asset), title: Text("MK1")),
          ListTile(leading: Icon(Icons.videogame_asset), title: Text("FC 26")),
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
