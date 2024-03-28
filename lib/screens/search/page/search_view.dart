import 'package:flutter/material.dart';
import 'package:movies_app/core/config/constants.dart';
import 'package:movies_app/core/network/api_manager.dart';

class SearchView extends StatefulWidget {
  const SearchView({
    super.key,
  });

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      searchController.text = value;
                      print(searchController);
                    },

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    enabled: true,
                    decoration: InputDecoration(
                      filled: true,
                      focusColor: const Color(0xff514F4F),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      fillColor: const Color(0xff514F4F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Color(0xff514F4F)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                      prefixIcon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Constants.mediaQuery.height * 0.35),
                Image.asset('assets/images/search_movies_icon.png'),
                const SizedBox(height: 10),
                Text(
                  "No movies found",
                  style: Constants.theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 15),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
