import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';

class Constants {

  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);

  static const String apiKey = "989ed6ebd88704a571dc5c45b77e838a";
  static const String baseUrl = "themoviedb.org";

}