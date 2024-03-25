// end point => api.themoviedb.org

import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../model/movies_model.dart';
import '../config/constants.dart';

class PopularMovieApi {
  static Future<List<PopularMoviesModel>> fetchPopularMovie() async {
    var url = Uri.https(
      Constants.baseUrl,
      "/3/movie/popular",
      {
        "apiKey": Constants.apiKey,
      },
    );

    final response = await http.get(
      url,
      headers: {
        "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGI4MGY4ZTA0OWNmNGQ3OGM1ODFhYmFkNDdlNTdmMSIsInN1YiI6IjY2MDAxYzg2MGMxMjU1MDE0YjBhZmIyMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uwe9yjQ2QKbe7_sINtF1S1BHo98FNO1FVZSLztSB1d4"
      },
    );

    List<PopularMoviesModel> popularMoviesList = [];

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      var resultsData = data["results"] as List;
      for (var e in resultsData) {
        popularMoviesList.add(PopularMoviesModel.fromJson(e));
      }
      return popularMoviesList;
    } else {
      throw Exception(Exception);
    }
  }
}
