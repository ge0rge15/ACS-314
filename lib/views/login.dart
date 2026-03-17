import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "Login Screen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/profilepic.png', height: 100, width: 100),
            //Text(
            // "Login Screen",
            // style: TextStyle(
            //   color: Colors.black,
            //  fontSize: 30,
            // fontWeight: FontWeight.bold,
            // ),
            // ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter username",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Pin or password",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Enter password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            Row(
              children: const [
                Text(
                  "Confirm Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: const Icon(Icons.visibility),
                hintText: "Confirm password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {},
              //child: Text(
              //  "Login",
              //  style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            //  color: Colors.blueAccent,
            // ),
            Container(
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Row(
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/signup");
                      // Navigate to the signup screen
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  Text("Signup", style: TextStyle(color: Colors.blueAccent)),
                  Spacer(),
                  Text("Forgot password?"),
                  Text("reset", style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
