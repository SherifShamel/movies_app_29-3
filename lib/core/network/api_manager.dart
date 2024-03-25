import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/model/FinalModelTest.dart';
import 'package:movies_app/model/movies_model.dart';

class ApiManager {
  static Future<List<Results>> getPopularMovies() async {
    var url = Uri.http(Constants.baseUrl, "/3/movie/popular", {
      "apiKey": Constants.apiKey,
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ODllZDZlYmQ4ODcwNGE1NzFkYzVjNDViNzdlODM4YSIsInN1YiI6IjY1ZmI2NWU5NTQ1MDhkMDE3Y2Y4ZmZkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ut5Ee5N_BejVvYFE05CoKVIxkD3V9q2oopxOSRpfZNk",
    });

    var response = await http.get(url);
    List<Results> moviesDataList = [];

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      for (var e in dataList) {
        dataList.add(Results.fromJson(e));
      }
      return moviesDataList;
    } else {

      throw Exception('Failed to load album');
    }
  }
}
