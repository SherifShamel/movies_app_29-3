import 'package:flutter/material.dart';
import '../../../core/network/api_manager.dart';
import '../../../main.dart';
import '../widgets/browse_widget.dart';
import 'genre_view.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PopularMovieApi.fetchBrowse(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var data = snapshot.data ?? [];
          return GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4 / 3,
            ),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                print(snapshot.data?[index].id);

                navigatorKey.currentState!.pushNamed(
                  GenreView.routeName,
                  arguments: snapshot.data![index]
                );
                // print(snapshot.data![index].id
                // );
              },
              child: BrowseWidget(
                moviesModel: snapshot.data![index],
              ),
            ),
          );
        },
      ),
    );
  }
}
