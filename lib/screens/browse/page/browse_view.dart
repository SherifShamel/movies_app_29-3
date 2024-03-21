import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: Center(
          child: Text("Browse View",
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
