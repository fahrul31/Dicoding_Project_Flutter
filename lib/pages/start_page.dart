import 'dart:html';

import 'package:dicoding_project/pages/home_page.dart';
import 'package:dicoding_project/pages/sign_in.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final screen = [
    HomePage(),
    const Center(
      child: Text(
        'Index 1: Search',
      ),
    ),
    const Center(
      child: Text(
        'Index 2: Cart',
      ),
    ),
    const Center(
      child: Text(
        'Index 3: Notification',
      ),
    ),
    SignInPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onTap(2);
        },
        child: const Icon(Icons.add_shopping_cart_rounded),
        elevation: 4,
        backgroundColor: const Color(0xff367668),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.grey,
        onTap: _onTap,
        elevation: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.white),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "",
          ),
        ],
      ),
      body: screen[_currentIndex],
    );
  }
}