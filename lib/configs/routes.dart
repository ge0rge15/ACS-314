import 'package:get/get.dart';
import 'package:flutter_application_2/views/login.dart';
import 'package:flutter_application_2/views/signup.dart';
import 'package:flutter_application_2/views/homescreen.dart';

var routes = [
  GetPage(name: "/login", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignupScreen()),
  GetPage(name: "/home", page: () => Homescreen()),
];
