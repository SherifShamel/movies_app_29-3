import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "Home";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),
            Stack(
              clipBehavior: Clip.none,
              // alignment: Alignment.centerLeft,
              children: [

                // Display image
                Container(
                  width: Constants.mediaQuery.width,
                  height: Constants.mediaQuery.height * 0.3,
                  color: Colors.white,
                ),

                // movie small image
                Positioned(
                  left: 30,
                  top: 160,
                  child: Container(
                    width: 140,
                    height: 200,
                    color: Colors.grey,
                  ),
                ),

                // Name of movie
                Padding(
                  padding: const EdgeInsets.only(top: 290.0, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Dora and the lost city of gold",
                      textAlign: TextAlign.end,
                      style: Constants.theme.textTheme.bodyMedium?.copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                ),

                // Time of movie
                Padding(
                  padding: const EdgeInsets.only(left: 175 ,top: 315.0, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("2019  PG-13  2h 7m",
                      textAlign: TextAlign.end,
                      style: Constants.theme.textTheme.bodySmall?.copyWith(color: Color(0xffB5B4B4) ,fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
