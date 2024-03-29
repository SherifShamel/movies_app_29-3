class MoviesModel {
  int id;
  String backdropPath;
  String title;
  String releaseDate;
  String posterPath;
  String originalTitle;
  double voteAverage;

  MoviesModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
    required this.posterPath,
    required this.originalTitle,
    required this.voteAverage

  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      MoviesModel(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        originalTitle: json['original_title'],
        voteAverage: json['vote_average'],
      );
}
