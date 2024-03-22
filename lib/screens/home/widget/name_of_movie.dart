import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class NameOfMovie extends StatelessWidget {
  const NameOfMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 205.0, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Dora and the lost city of gold",
            textAlign: TextAlign.end,
            style: Constants.theme.textTheme.bodyMedium
                ?.copyWith(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
