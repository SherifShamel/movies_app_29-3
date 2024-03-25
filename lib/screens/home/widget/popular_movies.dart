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
    ApiManager.getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Movie Images ( Small & Display )

        CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
            autoPlay: false,
            autoPlayAnimationDuration: Duration(seconds: 2),
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return Stack(clipBehavior: Clip.none, children: [
              //Display Image
              Container(
                width: Constants.mediaQuery.width,
                height: 200,
                // color: Colors.white,
                child: FutureBuilder(
                  future: ApiManager.getPopularMovies(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    var dataList = snapshot.data ?? [];
                    var imageUrl =
                        "${Constants.imagePath}${dataList[index].backdropPath}";
                    return Image.network(imageUrl);
                  },
                ),
              ),

              //Small Image
              Positioned(
                top: 90,
                left: 7,
                child: Container(
                  height: 170,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    // borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),

              // Movie Name & Time
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Movie Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Dora and the lost city of gold",
                          style: Constants.theme.textTheme.bodyMedium
                              ?.copyWith(fontSize: 17.5),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),

                    const SizedBox(height: 3),

                    //Movie Time
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "2019  PG-13  2h 7m",
                          style: Constants.theme.textTheme.bodySmall,
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]);
          },
        ),
      ],
    );
  }
}
