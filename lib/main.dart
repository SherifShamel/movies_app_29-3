
import 'package:flutter/material.dart';
import 'package:movies_app/core/config/application_theme_manager.dart';
import 'package:movies_app/layout/layout_view.dart';
import 'package:movies_app/pages/splash/splash_view.dart';
import 'package:movies_app/screens/browse/pages/genre_view.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ApplicationThemeManager.applicationThemeData,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName : (context) => const SplashView(),
        LayoutView.routeName : (context) => const LayoutView(),
        GenreView.routeName : (context) => const GenreView(),
      },
      navigatorKey: navigatorKey,
    );
  }
}


