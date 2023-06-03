import 'package:flutter/material.dart';
import 'package:good_news/pages/bottombar.dart';
import 'package:good_news/pages/detail_berita.dart';
import 'package:good_news/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../models/news.dart';
import '../providers/all_berita.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search";
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isInit = true;
  List<String>? newsListSearch;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<News>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }
  // void dispose() {
  //   _textFocusNode.dispose();
  //   _textEditingController!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context).allBerita;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 17, 156, 89),
            title: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _textEditingController,
                focusNode: _textFocusNode,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                  contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    newsListSearch = news
                        .where((element) =>
                            element.title.contains(value.toUpperCase()))
                        .cast<String>()
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        newsListSearch!.length == 0) {
                      print('newsListSearch length ${newsListSearch!.length}');
                    }
                  });
                },
              ),
            ),
            leading: IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(BottomBar.routeName);
                // Navigator.pop(context, HomePage.routeName);
              },
            ),
          ),
        body: _textEditingController!.text.isNotEmpty &&
                newsListSearch!.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_off,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No results found,\nPlease try different keyword',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? newsListSearch!.length
                    : news.length,
                itemBuilder: (ctx, index) {
                  var id = news[index].id;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                              Navigator.of(context).pushNamed(
                                DetailBerita.routeName,
                                arguments: id,
                              );
                            },
                        
                        child: Row(
                          children: [
                            Container(
                          // color: Colors.amber,
                          // width: 200,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(news[index].urlToImage),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // color: Colors.green,
                          width: 320,
                          child: Text(
                            _textEditingController!.text.isNotEmpty
                                ? newsListSearch![index]
                                : news[index].title,
                            textAlign: TextAlign.justify,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        ),
                        // CircleAvatar(
                        //   backgroundImage: NetworkImage(news[index].urlToImage),
                        // ),
                        // SizedBox(
                        //   width: 10,
                        // ),
                        // Text(
                        //     _textEditingController!.text.isNotEmpty
                        //         ? newsListSearch![index]
                        //         : news[index].title,
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis),
                    ],),)],
                    ),
                  );
                }));
  }
}
