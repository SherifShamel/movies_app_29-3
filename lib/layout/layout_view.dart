import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/screens/browse/page/browse_view.dart';
import 'package:movies_app/screens/home/page/home_view.dart';
import 'package:movies_app/screens/list/page/movies_list_view.dart';
import 'package:movies_app/screens/search/page/search_view.dart';
import 'package:movies_app/screens/settings/page/settings_view.dart';

class LayoutView extends StatefulWidget {
  static const String routeName = 'Layout';

  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const BrowseView(),
    const MoviesListView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.theme.primaryColorDark,
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },

            items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/home_icon.png'),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/search_icon.png'),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/browse_icon.png'),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/list_icon.png'),
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Home"),
        ]),
      ),
    );
  }
}
