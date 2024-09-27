import 'package:flutter/material.dart';

class HomeScreenOptions extends StatelessWidget {

  final String image;
  final String text;
  VoidCallback callback;
  HomeScreenOptions({
    required this.image,
    required this.text,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(213, 251, 251, 251),
            borderRadius:
                BorderRadius.circular(20), // Make the corner more rounded
          ),
          child:  Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(image, height: 130, width: 130, fit: BoxFit.cover),
                Text(text, style: const TextStyle(fontSize: 30))
              ],
            ),
          ),
          // height: 180,
          width: 300),
    );
  }
}
