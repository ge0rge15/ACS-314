import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/routes.dart';
import 'package:flutter_application_2/views/login.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "/login",
      getPages: routes,
      debugShowCheckedModeBanner: false,
      // home: LoginScreen(),
    ),
  );
}

class MyApp {
  const MyApp();
}
