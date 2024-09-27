import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';


class RouteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final center = LatLng(10.3353, 76.2158);
    final radius =
        0.005; // Radius in degrees (approx 111 meters per 0.001 degree latitude)

    // Function to generate points for the circle
    List<LatLng> generateCirclePoints(
        LatLng center, double radius, int points) {
      List<LatLng> circlePoints = [];
      final angleStep = 2 * pi / points;
      for (int i = 0; i < points; i++) {
        final angle = angleStep * i;
        final dx = radius * cos(angle); // Change in longitude
        final dy = radius * sin(angle); // Change in latitude
        circlePoints.add(LatLng(center.latitude + dy, center.longitude + dx));
      }
      return circlePoints;
    }

    final circlePoints =
        generateCirclePoints(center, radius, 60); // 60 points for smoothness

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Zones",
          style: TextStyle(letterSpacing: 8),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: center,
          initialZoom: 16.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                points: circlePoints,
                color: const Color.fromARGB(255, 254, 31, 27).withOpacity(0.3),
                borderColor: const Color.fromARGB(255, 243, 33, 33),
                borderStrokeWidth: 2.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
