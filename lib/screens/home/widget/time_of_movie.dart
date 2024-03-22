import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class TimeOfMovie extends StatelessWidget {
  const TimeOfMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 175, top: 230.0, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "2019  PG-13  2h 7m",
            textAlign: TextAlign.end,
            style: Constants.theme.textTheme.bodySmall?.copyWith(
                color: const Color(0xffB5B4B4), fontSize: 17),
          ),
        ],
      ),
    );
  }
}
