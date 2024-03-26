import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:movies_app/model/movies_model.dart';
import 'package:movies_app/screens/home/widget/Recommended_widget.dart';
import 'package:movies_app/screens/home/widget/new_releases.dart';
import 'package:movies_app/screens/home/widget/popular_movies.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
    body: Center(
      child: Text(
        "Search View",
        style: Constants.theme.textTheme.titleLarge,
      ),
    ),
      ),
    );
  }
}
