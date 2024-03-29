

import 'package:movies_app/model/movies_model.dart';

class ApisCaller {
  final Future<List<MoviesModel>> popularApi;
  final Future<List<MoviesModel>> releaseApi;
  final Future<List<MoviesModel>> recommendedApi;

  ApisCaller(
      {required this.popularApi,
        required this.releaseApi,
        required this.recommendedApi});
}
