import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: Center(
          child: Text("Search View",
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
