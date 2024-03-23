import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:movies_app/model/movies_model.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  late Future<List<MoviesModel>> popularMovies;

  @override
  void initState() {
    ApiManager().getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Movie Images ( Small & Display )
        Stack(
          clipBehavior: Clip.none,
          children:[

            Container(
              width: Constants.mediaQuery.width,
              height: 200,
              color: Colors.white,
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Container(
                height: 170,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(7),
                ),

              ),
            ),

          ]
        ),

        // Movie Name & Time
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              //Movie Name
              Text("Dora and the lost city of gold",
              style: Constants.theme.textTheme.bodyMedium,
              textAlign: TextAlign.end,
              ),


              const SizedBox(height: 3),

              //Movie Time
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("2019  PG-13  2h 7m",
                  style: Constants.theme.textTheme.bodySmall,
                  textAlign: TextAlign.end,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
