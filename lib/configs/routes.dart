import 'package:flutter_application_2/views/dashboard.dart';
import 'package:flutter_application_2/views/homescreen.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2/views/login.dart';
import 'package:flutter_application_2/views/signup.dart';
import 'package:flutter_application_2/views/profile.dart';
import 'package:flutter_application_2/views/store.dart';
import 'package:flutter_application_2/views/library.dart';
import 'package:flutter_application_2/views/news.dart';
import 'package:flutter_application_2/views/play.dart';

var routes = [
  GetPage(name: "/login", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignupScreen()),
  GetPage(name: "/homescreen", page: () => Homescreen()),
  GetPage(name: "/profile", page: () => ProfileScreen()),
  GetPage(name: "/store", page: () => StoreScreen()),
  GetPage(name: "/library", page: () => LibraryScreen()),
  GetPage(name: "/news", page: () => NewsScreen()),
  GetPage(name: "/play", page: () => PlayScreen()),
  GetPage(name: "/dashboard", page: () => DashboardScreen()),
];
