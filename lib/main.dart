//LIB POST BARU
import 'package:flutter/material.dart';
import 'package:good_news/pages/add_berita.dart';
import 'package:good_news/pages/bottombar.dart';
import 'package:good_news/pages/detail_berita.dart';
import 'package:good_news/pages/edit_berita.dart';
import 'package:good_news/pages/edit_profil.dart';
import 'package:good_news/pages/profil.dart';
import 'package:good_news/pages/home_page.dart';
import 'package:good_news/pages/search.dart';
import 'package:good_news/pages/splash.dart';
import 'package:good_news/providers/all_berita.dart';
import 'package:good_news/providers/auth.dart';
import 'package:provider/provider.dart';
import './pages/auth_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => User(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => News(),
        )
      ],
    
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
        routes: {
          HomePage.routeName:(context) => HomePage(),
          EditBerita.routeName: (context) => EditBerita(),
          AddBerita.routeName: (context) => AddBerita(),
          DetailBerita.routeName: (context) => DetailBerita(),
          Profil_Page.routeName:(context) => Profil_Page(),
          Edit_Profil_Page.routeName:(context) => Edit_Profil_Page(),
          BottomBar.routeName:(context) => BottomBar(),
          SearchPage.routeName:(context) => SearchPage()
        },
      ),
    );
  }
}
