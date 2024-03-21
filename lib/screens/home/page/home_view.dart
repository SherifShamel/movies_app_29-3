import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class HomeView extends StatelessWidget {
  static const String routeName = "Home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: Center(
          child: Text("Home View",
          style: Constants.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
