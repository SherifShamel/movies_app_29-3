class GenreModel {
  int id;
  String backdropPath;
  String title;
  String overView;
  String releaseDate;

  GenreModel({
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.overView,
    required this.releaseDate,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json['genre_ids'],
        title: json['original_title'],
        releaseDate: json['release_date'],
        backdropPath: json['poster_path'],
        overView: json['overview'],
      );
}
