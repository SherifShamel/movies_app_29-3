import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class DisplayImageWidget extends StatelessWidget {
  const DisplayImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width,
      height: 200,
      color: Colors.white,
    );
  }
}
