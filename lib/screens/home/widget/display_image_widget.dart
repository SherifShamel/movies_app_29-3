import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';
import 'package:movies_app/model/movies_model.dart';

class DisplayImageWidget extends StatefulWidget {
  const DisplayImageWidget({super.key});

  @override
  State<DisplayImageWidget> createState() => _DisplayImageWidgetState();
}

class _DisplayImageWidgetState extends State<DisplayImageWidget> {
  late Future<List<MoviesModel>> popularMovies;

  @override
  void initState() {
    ApiManager().getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.width,
      height: 200,
      color: Colors.white,

      // child: FutureBuilder(future: popularMovies, builder: (context, snapshot) {
      //   if (snapshot.hasError) {
      //     return const Center(
      //       child: Text("same thing went wrong"),
      //     );
      //   }
      //   if (snapshot.connectionState == ConnectionState.waiting) {
      //     return const CircularProgressIndicator();
      //   }
      //
      //
      //   return Image.network(
      //     "${Constants.imagePath}"
      //   );
      // },)

      // child: FutureBuilder(
      //   future: popularMovies,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       return Center(
      //         child: Text(snapshot.hasError.toString()),
      //       );
      //     } else if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (snapshot.hasData) {
      //       final data = snapshot.data;
      //     }
      //     return Image.network(
      //         filterQuality: FilterQuality.high,
      //         fit: BoxFit.cover,
      //         "${Constants.imagePath}${snapshot.data}");
      //   },
      // ),
    );
  }
}
