import 'package:flutter/material.dart';

class ApplicationThemeManager {

  static ThemeData applicationThemeData = ThemeData(
    primaryColor: const Color(0xfffcb93a),
    primaryColorDark: const Color(0xff121312),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1D1E1D),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 35,
      )
    ),

    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Gotham",
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontFamily: "Gotham",
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Gotham",
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontFamily: "Gotham",
          fontWeight: FontWeight.w200,
          fontSize: 13,
          color: Colors.white,
        )),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff1A1A1A),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xffFFB224),
      unselectedItemColor: Color(0xffC6C6C6),

      unselectedIconTheme: IconThemeData(
        color: Color(0xffC6C6C6),
        size: 25,
      ),

      unselectedLabelStyle: TextStyle(
        fontFamily: "Gotham",
        fontSize: 15,
        fontWeight: FontWeight.normal,
        color: Color(0xffC6C6C6),
      ),

      selectedIconTheme: IconThemeData(
        color: Color(0xffFFB224),
        size: 35,
      ),

      selectedLabelStyle: TextStyle(
        fontFamily: "Gotham",
        fontSize: 17,
        fontWeight: FontWeight.bold,
        color:  Color(0xffFFB224),
      ),

    )
    
  );

}