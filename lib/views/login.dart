import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Logincontroller logincontroller = Get.put(Logincontroller());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> loginUser() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please enter username and password");
      return;
    }

    try {
      var url = Uri.parse("http://localhost/acs314/login.php");

      var response = await http.post(
        url,
        body: {
          "username": usernameController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      print(response.body);

      var data = jsonDecode(response.body);

      if (data["code"] == 1) {
        Get.offAllNamed("/homescreen");
      } else {
        Get.snackbar("Login Failed", "Invalid username or password");
      }
    } catch (e) {
      Get.snackbar("Error", "Cannot connect to server");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/profilepic.png', height: 100, width: 100),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter username",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter username",
                  prefixIcon: const Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              Obx(
                () => TextField(
                  controller: passwordController,
                  obscureText: logincontroller.isPasswordvisible.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        logincontroller.isPasswordvisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        logincontroller.togglePasswordy();
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              GestureDetector(
                onTap: loginUser,
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Row(
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/signup");
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    const Spacer(),
                    const Text("Forgot password?"),
                    const SizedBox(width: 5),
                    const Text(
                      "reset",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
