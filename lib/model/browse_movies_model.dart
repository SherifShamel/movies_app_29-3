
class BrowseMovieModel{
  int id;
  String name;
  BrowseMovieModel({required this.id, required this.name});

  factory BrowseMovieModel.fromJson(Map<String, dynamic> json) =>
      BrowseMovieModel(
        id: json['id'],
        name: json['name'],
      );
}