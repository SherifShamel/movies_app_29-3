import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: Center(
          child: Text("Settings View",
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
