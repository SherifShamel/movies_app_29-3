import 'package:flutter/material.dart';

class MovieSmallImage extends StatelessWidget {
  const MovieSmallImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      top: 80,
      child: Container(
        width: 140,
        height: 170,
        color: Colors.grey,
      ),
    );
  }
}
