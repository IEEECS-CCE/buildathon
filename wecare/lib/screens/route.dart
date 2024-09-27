import 'package:flutter/material.dart';
import 'package:wecare/screens/home.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true ,title: Text("Zones",style: TextStyle(letterSpacing: 8),),),
      body: MapScreen(),
    );
  }
}