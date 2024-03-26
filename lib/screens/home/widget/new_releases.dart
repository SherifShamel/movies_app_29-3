import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

import '../../../core/network/api_manager.dart';

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
              child: FutureBuilder(
            future: PopularMovieApi.fetchUpcomingMovie(),
            builder: (context, snapshot) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        top: 1, left: 8, right: 8, bottom: 8),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Constants.theme.primaryColorDark,
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
                              child: Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
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
