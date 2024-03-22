import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/model/movies_model.dart';

class ApiManager {
  static const _popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";

  Future<List<MoviesModel>> getPopularMovies () async {
    
    final response = await http.get(Uri.parse(_popularUrl));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body) ["results"] as List;
      return data.map((element) => MoviesModel.fromJson(element)).toList();
    }else{
      throw Exception("Same thing went wrong");
    }
  }
}
