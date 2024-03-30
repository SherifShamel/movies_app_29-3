import 'package:flutter/material.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:movies_app/screens/browse/widgets/genre_item_widget.dart';

class GenreView extends StatelessWidget {
  static const String routeName = "genreView";

  const GenreView({super.key});

  @override
  Widget build(BuildContext context) {
    // var genreId =
    //     ModalRoute.of(context)?.settings.arguments as BrowseMovieModel;

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: PopularMovieApi.fetchBrowse(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return const Text("Error Fetching Data");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemBuilder: (context, index) => GenreItemWidget(
              genreModel: snapshot.data![index],
            ),
            itemCount: snapshot.data?.length,
          );
        },
      ),
    );
  }
}
