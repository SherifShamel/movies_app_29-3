import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/screens/home/widget/Recommended_widget.dart';
import 'package:movies_app/screens/home/widget/display_image_widget.dart';
import 'package:movies_app/screens/home/widget/movie_small_image.dart';
import 'package:movies_app/screens/home/widget/name_of_movie.dart';
import 'package:movies_app/screens/home/widget/new_releases.dart';
import 'package:movies_app/screens/home/widget/time_of_movie.dart';

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
              children: [
                // Display image
                DisplayImageWidget(),

                // movie small image
                MovieSmallImage(),

                // Name of movie
               NameOfMovie(),

                // Time of movie
                TimeOfMovie(),
              ],
            ),
            const SizedBox(height: 20),

            // New Releases
            NewReleases(),


            const SizedBox(height: 30),

            // Recommended
            RecommendedWidget(),
          ],
        ),
      ),
    );
  }
}
