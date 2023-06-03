import 'package:flutter/material.dart';
import 'package:good_news/pages/add_berita.dart';
import 'package:good_news/pages/detail_berita.dart';
import 'package:good_news/pages/edit_berita.dart';
import 'package:good_news/providers/all_berita.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<News>(context).initialData();
    }
    isInit = false;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final allBeritaProvider = Provider.of<News>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 156, 89),
        title: Text("Good News", style: TextStyle(fontSize: 31)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddBerita.routeName);
            },
          ),
        ],
      ),
      body: (allBeritaProvider.jumlahBerita == 0)
        ? Container(
            child:Column(
              mainAxisSize: MainAxisSize.min, 
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "Berita Terpopuler",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  height: 280,
                  width: 360,
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              // color: Colors.amber,
                              width: 330,
                              child: Text(
                                'No Data',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context, AddBerita.routeName);
                                },
                                child: Text(
                                  "Add Berita",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 17, 156, 89),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    )
                  )
                ),

                // or login with
                Container(
                  // color: Colors.amber,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    children: const <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Divider(
                            thickness: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Berita Hari Ini',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Divider(
                            thickness: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                  // color: Colors.blue,
                  height: 200,
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) => Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    // color: Colors.amber,
                                    width: 330,
                                    child: Text(
                                      'No Data',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, AddBerita.routeName);
                                      },
                                      child: Text(
                                        "Add Berita",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 17, 156, 89),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),)
                )
              ]
            )
          )
          : Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  "Berita Terpopuler",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  height: 280,
                  width: 360,
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    scrollDirection: Axis.horizontal,
                    itemCount: allBeritaProvider.jumlahBerita,
                    itemBuilder: (context, index) {
                      var id = allBeritaProvider.allBerita[index].id;
                      return Card(
                        // color: Colors.blueGrey,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                DetailBerita.routeName,
                                arguments: id,
                              );
                            },
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  // color: Colors.amber,
                                  child: Image(
                                    height: 200,
                                    width: 330,
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      allBeritaProvider
                                        .allBerita[index]
                                        .urlToImage,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5 ),

                                Container(
                                  // color: Colors.amber,
                                  width: 330,
                                  child: Text(
                                    allBeritaProvider
                                      .allBerita[index].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                        )
                      );
                    }
                  )
                ),
                Container(
                  // color: Colors.amber,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    children: const <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Divider(
                            thickness: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        'Berita Hari Ini',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Divider(
                            thickness: 3,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.blue,
                    height: 200,
                    // width: 165,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      scrollDirection: Axis.vertical,
                      itemCount: allBeritaProvider.jumlahBerita,
                      itemBuilder: (context, index) {
                      var id = allBeritaProvider.allBerita[index].id;
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                DetailBerita.routeName,
                                arguments: id,
                              );
                            },
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  //menampilkan data gamabr
                                  allBeritaProvider
                                    .allBerita[index]
                                    .urlToImage,
                                  fit: BoxFit.cover,
                                  height: 105,
                                  width: 165,
                                ),
                                SizedBox(width: 10),
                                Container(
                                  alignment: Alignment.topLeft,
                                  // color: Colors.grey,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        // color: Colors.orange,
                                        width: 167,
                                        child: Text(
                                          allBeritaProvider
                                            .allBerita[index].title,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        // color: Colors.green,
                                        width: 167,
                                        child: Text(
                                          allBeritaProvider
                                            .allBerita[index].description,
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight:
                                            FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      );
                    }
                  )
                )
              ),
            ],
          ),
        )
    );
  }
}
