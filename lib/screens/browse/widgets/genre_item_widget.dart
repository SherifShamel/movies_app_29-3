import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/generated/assets.dart';
import 'package:movies_app/model/browse_movies_model.dart';

class GenreItemWidget extends StatelessWidget {
  final BrowseMovieModel genreModel;

  const GenreItemWidget({super.key, required this.genreModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: Constants.mediaQuery.width * 0.5,
          child: Image.asset(Assets.imagesAlita),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Genre: ${genreModel.name}",
                textAlign: TextAlign.start,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Genre Id: ${genreModel.id}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}
