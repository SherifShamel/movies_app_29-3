import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedWidget extends StatefulWidget {
  const RecommendedWidget({super.key});

  @override
  State<RecommendedWidget> createState() => _RecommendedWidgetState();
}

class _RecommendedWidgetState extends State<RecommendedWidget> {
  @override
  void initState() {
    PopularMovieApi.fetchTopRatedMovie();
    super.initState();
  }

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
              "Recommended",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium,
            ),
          ),

          // Recommended Container
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.only(top: 1, left: 8, right: 8, bottom: 8),
                child: Column(
                  children: [
                    FutureBuilder(
                      future: PopularMovieApi.fetchTopRatedMovie(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Error"),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Constants.theme.primaryColor,
                              strokeWidth: 1.0,
                            ),
                          );
                        }
                        //Top Container
                        return Stack(
                          children: [
                            Container(
                              height: 130,
                              width: 120,
                              decoration: BoxDecoration(
                                // color: Constants.theme.primaryColor,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
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
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    // Down Container
                    Container(
                      height: 70,
                      width: 120,
                      decoration: const BoxDecoration(
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
