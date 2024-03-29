import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  void initState() {
    PopularMovieApi.fetchPopularMovie();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          print('helooo');
        },
        child: SizedBox(
          height: Constants.mediaQuery.height * 0.29,
          width: Constants.mediaQuery.width,
          // color: Constants.theme.primaryColorDark,
          child: FutureBuilder(
            future: PopularMovieApi.fetchPopularMovie(),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Center(
                  child: Text("Thomathing Went wrong"),
                );
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Skeletonizer(
                  enabled:true,
                    child: ListView.builder(
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
                                height: Constants.mediaQuery.height * 0.23,
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
                                top: Constants.mediaQuery.height * 0.040,
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
                    ),
                );
              }
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
                          height: Constants.mediaQuery.height * 0.23,
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
                          top: Constants.mediaQuery.height * 0.040,
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
              // return ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //   physics: const BouncingScrollPhysics(),
              //   itemBuilder: (context, index) => CarouselSlider.builder(
              //     itemCount: 10,
              //     options: CarouselOptions(
              //       autoPlay: false,
              //       autoPlayAnimationDuration: const Duration(seconds: 2),
              //       viewportFraction: 1,
              //       scrollDirection: Axis.horizontal,
              //     ),
              //     itemBuilder: (context, index, realIndex) {
              //       return Stack(
              //         clipBehavior: Clip.none,
              //         children: [
              //           // Backdrop Image
              //           Positioned(
              //             bottom: 40,
              //             height: Constants.mediaQuery.height * 0.23,
              //             child: Container(
              //               width: Constants.mediaQuery.width,
              //               height: Constants.mediaQuery.height * 0.3,
              //               decoration: BoxDecoration(
              //                 // color: const Color(0xff282A28),
              //                 image: DecorationImage(
              //                   image: NetworkImage(
              //                       "${Constants.imagePath}${snapshot.data?[index].backdropPath}"),
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //           ),
              //
              //           // Poster Image
              //           Positioned(
              //             left: 10,
              //             top: Constants.mediaQuery.height * 0.040,
              //             child: Stack(
              //               children: [
              //                 Container(
              //                   clipBehavior: Clip.none,
              //                   height: 170,
              //                   width: 130,
              //                   decoration: BoxDecoration(
              //                     color: const Color(0xff282A28),
              //                     borderRadius: BorderRadius.circular(10),
              //                     image: DecorationImage(
              //                       image: NetworkImage(
              //                           "${Constants.imagePath}${snapshot.data?[index].posterPath}"),
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                 ),
              //
              //                 // Add to Favorite (Background)
              //                 Image.asset('assets/images/favorite.png'),
              //
              //                 // Add To Favorite
              //                 const Positioned(
              //                   left: 2,
              //                   child: InkWell(
              //                       child: Icon(Icons.add, color: Colors.white,)),
              //                 )
              //               ],
              //             ),
              //           ),
              //
              //           // Movies Name
              //           Padding(
              //             padding: const EdgeInsets.only(top: 10, left: 20, ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.end,
              //               crossAxisAlignment: CrossAxisAlignment.stretch,
              //               children: [
              //                 //Movie Name
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text("${snapshot.data?[index].title}",
              //                     style: Constants.theme.textTheme.bodyLarge?.copyWith(fontSize: 13),
              //                     ),
              //
              //                   ],
              //                 ),
              //
              //                 //Movie Time
              //                 Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                   children: [
              //                     Text("${snapshot.data?[index].releaseDate}",
              //                       style: Constants.theme.textTheme.bodyLarge?.copyWith(fontSize: 13),
              //                     ),
              //
              //                   ],
              //                 ),
              //               ],
              //             ),
              //             )
              //         ],
              //       );
              //     },
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }



}
