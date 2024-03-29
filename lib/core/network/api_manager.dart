// end point => api.themoviedb.org

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/browse_movies_model.dart';
import '../../model/movies_model.dart';
import '../config/constants.dart';

class PopularMovieApi {
  static Future<List<MoviesModel>> fetchPopularMovie() async {
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

    List<MoviesModel> popularMoviesList = [];

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      var resultsData = data["results"] as List;
      for (var e in resultsData) {
        popularMoviesList.add(MoviesModel.fromJson(e));
      }
      return popularMoviesList;
    } else {
      throw Exception(Exception);
    }
  }

  static Future<List<MoviesModel>> fetchUpcomingMovie() async {
    var url = Uri.https(
      Constants.baseUrl,
      "/3/movie/upcoming",
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

    List<MoviesModel> upComingMovies = [];

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      var resultsData = data["results"] as List;
      for (var e in resultsData) {
        upComingMovies.add(MoviesModel.fromJson(e));
      }
      return upComingMovies;
    } else {
      throw Exception(Exception);
    }
  }

  static Future<List<MoviesModel>> fetchTopRatedMovie() async {
    var url = Uri.https(
      Constants.baseUrl,
      "/3/movie/top_rated",
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

    List<MoviesModel> topRatedMovies = [];

    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      var resultsData = data["results"] as List;
      for (var e in resultsData) {
        topRatedMovies.add(MoviesModel.fromJson(e));
      }
      return topRatedMovies;
    } else {
      throw Exception(Exception);
    }
  }

  static Future<List<BrowseMovieModel>> fetchBrowse() async {
    var url = Uri.https(
      Constants.baseUrl,
      "/3/genre/movie/list",
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

    List<BrowseMovieModel> browseMovies = [];

    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      var resultsData = data["genres"] as List;
      for (var e in resultsData) {
        browseMovies.add(BrowseMovieModel.fromJson(e));
      }
      return browseMovies;
    } else {
      throw Exception(Exception);
    }
  }
}
