import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width,
      height: 250,
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

          // New Releases Container
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.only(top: 1, left: 8, right: 8, bottom: 8),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Constants.theme.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                        ),
                      ),
                    ),


                    Container(
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xff343534),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ],
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
