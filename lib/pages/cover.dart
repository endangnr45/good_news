import 'package:flutter/material.dart';

// void main() {
//   runApp(const goodNews());
// }
// class goodNews extends StatelessWidget {
//   const goodNews({Key? key}) : super(key: key);

  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
  class Cover_Page extends StatefulWidget {
  const Cover_Page({Key? key}) : super(key: key);

  @override
  State<Cover_Page> createState() => _Cover_PageState();
}

class _Cover_PageState extends State<Cover_Page> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
          child:
          Image.asset('assets/images/logo_good_news.png'),
        ),
        backgroundColor: Colors.white,
    );
  } 
}