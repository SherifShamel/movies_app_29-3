class PopularMoviesModel {
  int id;
  String backdropPath;
  String title;
  String releaseDate;
  String posterPath;
  // String voteAverage;
  String originalTitle;

  PopularMoviesModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.backdropPath,
    required this.posterPath,
    // required this.voteAverage,
    required this.originalTitle,

  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) =>
      PopularMoviesModel(
        id: json['id'],
        title: json['title'],
        releaseDate: json['release_date'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        // voteAverage: json['vote_average'],
        originalTitle: json['original_title'],
      );
}
