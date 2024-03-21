import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: Center(
          child: Text("Movies List View",
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
