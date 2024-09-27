import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wecare/screens/signup.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();


    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });


    Future.delayed(const Duration(seconds: 3), () {
      Get.off(()=> SignUpPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity, 
          duration: const Duration(seconds: 3), 
          child: Image.asset(
            'assets/images/logo.png', 
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
