import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedView extends StatefulWidget {
  const RecommendedView({super.key});

  @override
  State<RecommendedView> createState() => _RecommendedViewState();
}

class _RecommendedViewState extends State<RecommendedView> {
  @override
  void initState() {
    PopularMovieApi.fetchTopRatedMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width,
      height: Constants.mediaQuery.height * 0.32,
      color: const Color(0xff282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Recommended",
              textAlign: TextAlign.start,
              style: Constants.theme.textTheme.bodyMedium,
            ),
          ),

          // Recommended
          Expanded(
              child: FutureBuilder(
            future: PopularMovieApi.fetchTopRatedMovie(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Same thing went wrong"),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Skeletonizer(
                    enabled: true,
                    // effect: PulseEffect(duration: Duration(seconds: 2)),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          width: 120,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        top: 1, left: 8, right: 8, bottom: 8),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            //Top Container
                            Container(
                              height: 160,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)),
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
                              )),
                            ),

                            // Down Container
                            Positioned(
                              top: 155,
                              child: Container(
                                height: 80,
                                width: 120,
                                decoration: const BoxDecoration(
                                  color: Color(0xff343534),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 7, left: 5),

                                  // Name & Vote & Date
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [

                                      // Icon & Rate
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Constants.theme.primaryColor,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${snapshot.data?[index].voteAverage}',
                                            style: Constants
                                                .theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),

                                      // Name
                                      Text(
                                        "${snapshot.data?[index].title}",
                                        style: Constants
                                            .theme.textTheme.bodySmall
                                            ?.copyWith(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),

                                      // Date
                                      Text(
                                        "${snapshot.data?[index].releaseDate}",
                                        textAlign: TextAlign.start,
                                        style:
                                            Constants.theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                itemCount: 10,
              );
            },
          )),
        ],
      ),
    );
  }
}
