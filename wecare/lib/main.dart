import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wecare/screens/home.dart';
import 'package:wecare/screens/login.dart';
import 'package:wecare/screens/signup.dart';
import 'package:wecare/screens/splash.dart';
import 'package:wecare/services/local_notification.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async{

  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  LocalNotification.initialize(flutterLocalNotificationsPlugin);

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
        GetPage(name: '/sign-in', page: () => SignUpPage()),
        GetPage(name: '/log-in', page: () => LoginPage()),
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(),
      ),
    );
  }
}
