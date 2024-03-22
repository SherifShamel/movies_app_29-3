import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:movies_app/model/movies_model.dart';

class DisplayImageWidget extends StatefulWidget {
  const DisplayImageWidget({super.key});

  @override
  State<DisplayImageWidget> createState() => _DisplayImageWidgetState();
}


class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  late Future<List<MoviesModel>> popularMovies;
  @override
  void initState() {
    ApiManager().getPopularMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width,
      height: 200,
      color: Colors.white,
    );
  }
}
