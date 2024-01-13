// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNavegationBar = 0;

  void changeIndex(int index) {
    setState(() {
      indexBottomNavegationBar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Study',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          changeIndex(index);
        },
        controller: _pageController,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavegationBar,
        onTap: (int index) {
          changeIndex(index);
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle,
              //color: Colors.blue,
            ),
            label: 'Blue',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle,
              //color: Colors.yellow,
            ),
            label: 'Yellow',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.circle,
              //color: Colors.red,
            ),
            label: 'Red',
          ),
        ],
      ),
    );
  }
}
