import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/layout/layout_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff121312),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/logo.png',
          ),
        ),
      ),
    );
  }
}
