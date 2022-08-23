import 'package:flutter/material.dart';
import 'dart:async';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),() => Navigator.pushNamed(context, "/start-page"));
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/images/kulineran.png')
            ),
          ),
        ),
      ),
    );
  }
}

