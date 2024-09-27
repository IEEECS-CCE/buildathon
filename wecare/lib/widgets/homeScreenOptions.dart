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
            color: const Color.fromARGB(196, 251, 251, 251),
            borderRadius:
                BorderRadius.circular(20), // Make the corner more rounded
          ),
          child:  Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(image),
                Text(text)
              ],
            ),
          ),
          height: 140,
          width: 140),
    );
  }
}
