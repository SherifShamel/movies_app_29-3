class MoviesModel {
  final String id;
  final String title;
  final String backDropPath;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String voteAverage;

  MoviesModel({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"],
        title: json["title"],
        backDropPath: json["backDropPath"],
        originalTitle: json["originalTitle"],
        overview: json["overview"],
        posterPath: json["posterPath"],
        releaseDate: json["releaseDate"],
        voteAverage: json["voteAverage"],
      );
}
