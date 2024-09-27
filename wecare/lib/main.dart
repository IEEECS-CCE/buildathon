// this is the dummy app


// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:wecare/firebase_options.dart';
import 'package:wecare/screens/home.dart';
import 'package:wecare/screens/login.dart';
import 'package:wecare/screens/signin.dart';
import 'package:wecare/screens/splash.dart';
// import 'package:permission_handler/permission_handler.dart';

void main()async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // WidgetsFlutterBinding.ensureInitialized();

  // var status = await Permission.camera.status;
  


  // if (await Permission.location.isRestricted) {
  //   await Permission.location.request();
  // }

  // await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(
            name: '/home',
            page: () => HomePage()),
        GetPage(name: '/sign-in', page: () => SignInPage()),
        GetPage(name: '/log-in', page: () => LoginPage()),
      ],
    );
  }
}

