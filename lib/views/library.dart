import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Library"),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
              onPressed: () {
                Get.offAndToNamed("/library");
              },
              icon: Icon(Icons.library_add_check),
            ),
          ),
        ],
      ),
      body: Center(child: Text("Games")),
    );
  }
}
