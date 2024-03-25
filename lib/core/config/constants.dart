import 'package:flutter/material.dart';
import 'package:movies_app/main.dart';

class Constants {

  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);


  static const String apiKey = "989ed6ebd88704a571dc5c45b77e838a";
  static const String baseUrl = "api.themoviedb.org";
  static const String imagePath = "https://image.tmdb.org/t/p/w500";
}

//wkfG7DaExmcVsGLR4kLouMwxeT5.jpg