import 'package:flutter/material.dart';
import 'package:movies_app/generated/assets.dart';

import '../../model/browse_movies_model.dart';

class BrowseWidget extends StatelessWidget {
  final BrowseMovieModel moviesModel;

  BrowseWidget({super.key, required this.moviesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesAlita),
          fit: BoxFit.cover,
          opacity: 0.5,
          // fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(child: Text(moviesModel.name)),
    );
  }
}
