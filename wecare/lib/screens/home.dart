import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wecare/navigator/chat.dart';
import 'package:wecare/screens/blood-bank.dart';
import 'package:wecare/widgets/homeScreenOptions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: Image.asset('assets/images/logo2.png'),
      ),
      title: const Text("WE CARE",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 6)),
    );

    double distance = 50;
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Map(),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top:13.0),
              child: Column(
                          // mainAxisAlignment: MainAxisAlignment.,
                          children: [
                            HomeScreenOptions(
                              callback: () {
                                Get.off(() => ChatBot());
                              },
                              image: 'assets/images/doc.png',
                              text: "Consultation",
                            ),
                            SizedBox(height: distance), // Space between buttons
                            HomeScreenOptions(
                              callback: () {
                                Get.to(() => BloodBank());
                              },
                              image: 'assets/images/blood.png',
                              text: "Blood Bank",
                            ),
                            SizedBox(
                              height: distance,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HomeScreenOptions(
                                  callback: () {},
                                  image: 'assets/images/route.png',
                                  text: "Route Map",
                                ),
                               
                              ],
                            ),
                          ],
              ),
            ),
          ),
        ],
      ),

      // bottomNavigationBar: BottomNavigationBar(items: items),
    );
  }
}

class Map extends StatefulWidget {
  const Map({super.key});

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter:
            LatLng(10.3353, 76.2158), // Center the map over London
        initialZoom: 12,
      ),
      children: [
        TileLayer(
          // Display map tiles from any source
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
          userAgentPackageName: 'com.example.app',
          // And many more recommended properties!
        ),
        RichAttributionWidget(
          // Include a stylish prebuilt attribution widget that meets all requirments
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () => launchUrl(Uri.parse(
                  'https://openstreetmap.org/copyright')), // (external)
            ),
            // Also add images...
          ],
        ),
      ],
    );
  }
}
