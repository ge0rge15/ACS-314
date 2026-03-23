import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

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
      children: const [
        Card(child: Center(child: Text("Game 1"))),
        Card(child: Center(child: Text("Game 2"))),
        Card(child: Center(child: Text("Game 3"))),
        Card(child: Center(child: Text("Game 4"))),
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

    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        SizedBox(height: 10),
        Text(
          "Username",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("user@email.com"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_page]),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
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
