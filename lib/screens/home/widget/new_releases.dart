import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class NewReleases extends StatelessWidget {
  const NewReleases({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width,
      height: 200,
      color: const Color(0xff282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "New Releases",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium,
            ),
          ),

          // New Releases
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 1, left: 8, right: 8, bottom: 8),
                child: Container(
                  height: 100,
                  width: 120 ,
                  decoration: BoxDecoration(
                    color: Constants.theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              itemCount: 10,
            ),
          ),


        ],
      ),
    );
  }
}