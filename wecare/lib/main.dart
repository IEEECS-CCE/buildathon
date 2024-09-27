import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:wecare/screens/home.dart';
import 'package:wecare/screens/login.dart';
import 'package:wecare/screens/signin.dart';
import 'package:wecare/screens/splash.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/sign-in', page: () => SignInPage()),
        GetPage(name: '/log-in', page: () => LoginPage()),
      ],
    );
  }
}
