import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wecare/widgets/homeScreenOptions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      centerTitle: true,
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
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.,
                    children: [
                      Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                      HomeScreenOptions(
                        callback: () {},
                        image: 'assets/images/doc.png',
                        text: "Consultation",
                      ),
                      SizedBox(width: distance), // Space between buttons
                      HomeScreenOptions(
                        callback: () {},
                        image: 'assets/images/blood.png',
                        text: "Blood Bank",
                      ),
                                    ],
                                  ),
                                  SizedBox(height: distance,),
                                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HomeScreenOptions(
                        callback: () {},
                        image: 'assets/images/route.png',
                        text: "Route Map",
                      ),
                      SizedBox(width: distance), // Space between buttons
                      HomeScreenOptions(
                        callback: () {},
                        image: 'assets/images/profile.png',
                        text: "My Profile",
                      ),
                    ],
                  ),
                    ],
                  ),
                )),
          ),
        ],
      ),
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
            LatLng(51.509364, -0.128928), // Center the map over London
        initialZoom: 9.2,
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
