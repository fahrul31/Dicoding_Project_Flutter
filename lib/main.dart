import 'package:dicoding_project/pages/detail_page.dart';
import 'package:dicoding_project/pages/home_page.dart';
import 'package:dicoding_project/pages/sign_in.dart';
import 'package:dicoding_project/pages/splash_page.dart';
import 'package:dicoding_project/pages/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicoding Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in' : (context) => SignInPage(), 
        '/home-page' : (context) => HomePage(),
        '/detail-page' :(context) => const DetailPage(),
        '/start-page' :(context) => StartPage(),
      },
    );
  }
}
