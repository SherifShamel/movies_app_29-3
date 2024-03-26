import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularTest extends StatefulWidget {
  const PopularTest({super.key});

  @override
  State<PopularTest> createState() => _PopularTestState();
}

class _PopularTestState extends State<PopularTest> {
  @override
  void initState() {
    PopularMovieApi.fetchPopularMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.mediaQuery.height * 0.32,
      width: Constants.mediaQuery.width,
      color: Constants.theme.primaryColorDark,
      child: FutureBuilder(
        future: PopularMovieApi.fetchPopularMovie(),
        builder: (context, snapshot) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => CarouselSlider.builder(
              itemCount: 10,
              options: CarouselOptions(
                autoPlay: false,
                autoPlayAnimationDuration: const Duration(seconds: 2),
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Backdrop Image
                    Positioned(
                      bottom: 40,
                      height: Constants.mediaQuery.height * 0.26,
                      child: Container(
                        width: Constants.mediaQuery.width,
                        height: Constants.mediaQuery.height * 0.3,
                        decoration: BoxDecoration(
                          // color: const Color(0xff282A28),
                          image: DecorationImage(
                            image: NetworkImage(
                                "${Constants.imagePath}${snapshot.data?[index].backdropPath}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // Poster Image
                    Positioned(
                      left: 10,
                      top: Constants.mediaQuery.height * 0.1,
                      child: Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.none,
                            height: 170,
                            width: 130,
                            decoration: BoxDecoration(
                              color: const Color(0xff282A28),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "${Constants.imagePath}${snapshot.data?[index].posterPath}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          // Add to Favorite (Background)
                          Image.asset('assets/images/favorite.png'),

                          // Add To Favorite
                          const Positioned(
                            left: 2,
                            child: InkWell(
                                child: Icon(Icons.add, color: Colors.white,)),
                          )
                        ],
                      ),
                    ),

                    // Movies Name
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20, ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //Movie Name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${snapshot.data?[index].title}",
                              style: Constants.theme.textTheme.bodyLarge?.copyWith(fontSize: 13),
                              ),

                            ],
                          ),

                          //Movie Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("${snapshot.data?[index].releaseDate}",
                                style: Constants.theme.textTheme.bodyLarge?.copyWith(fontSize: 13),
                              ),

                            ],
                          ),
                        ],
                      ),
                      )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
