import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/screens/home/widget/Recommended_widget.dart';
import 'package:movies_app/screens/home/widget/popular_movies.dart';
import 'package:movies_app/screens/home/widget/new_releases.dart';

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

            PopularMovies(),
            const SizedBox(height: 30),

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
