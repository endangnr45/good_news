import 'package:flutter/material.dart';
import 'package:good_news/pages/home_page.dart';
import 'package:good_news/pages/profil.dart';
import 'package:good_news/pages/search.dart';
import 'package:good_news/my_flutter_app_icons.dart';

class BottomBar extends StatefulWidget {
  static const routeName = '/bottom-bar';
  // const Scroll({Key? key}) : super(key: key);

  //final List<Widget> mylist = [];

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  final screens = [
    // Scroll(),
    HomePage(),
    SearchPage(),
    // Tambah_Berita(),
    Profil_Page(),
    //Edit_Profil_Page(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 17, 156, 89),
            selectedItemColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            iconSize: 30,
            selectedFontSize: 15,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(MyFlutterApp.plus),
              //   label: 'Add',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
      );
}
