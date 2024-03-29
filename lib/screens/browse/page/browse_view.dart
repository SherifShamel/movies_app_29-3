import 'package:flutter/material.dart';

import '../../../core/network/api_manager.dart';
import '../browse_widget.dart';

class BrowseView extends StatelessWidget {
  const BrowseView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
            childAspectRatio: 4/3,
          ),
          itemBuilder: (context, index) =>
              BrowseWidget(moviesModel: snapshot.data![index]),
        );
      },
    );
  }
}
