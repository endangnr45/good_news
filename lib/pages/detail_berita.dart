import 'package:flutter/material.dart';
import 'package:good_news/pages/edit_berita.dart';
import 'package:good_news/pages/home_page.dart';
import 'package:good_news/providers/all_berita.dart';
import 'package:provider/provider.dart';

class DetailBerita extends StatelessWidget {
  static const routeName = "/detail-berita";
  get index => News().allBerita[index].id;

  @override
  Widget build(BuildContext context) {
    final allBeritaProvider = Provider.of<News>(context);
    final news = Provider.of<News>(context, listen: false);
    final newsId = ModalRoute.of(context)?.settings.arguments as String;
    final selectBerita = news.selectById(newsId);
    final TextEditingController imageController =
        TextEditingController(text: selectBerita.urlToImage);
    final TextEditingController nameController =
        TextEditingController(text: selectBerita.title);
    final TextEditingController positionController =
        TextEditingController(text: selectBerita.description);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Good News",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 31,
                  fontFamily: 'Alata Reguler',
                )),
            backgroundColor: Color.fromARGB(255, 17, 156, 89),
            leading: IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
          ),
          body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                  children: [
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Text(
                      nameController.text,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      imageController.text,
                      // width: 500,
                      height: 200,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      selectBerita.createdAt.toString(),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      positionController.text,
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: OutlinedButton(
                                onPressed: () {
                                  allBeritaProvider.deleteBerita(selectBerita.id).then(
                                    (value){
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text("Berhasil dihapus"),
                                          duration: Duration(milliseconds: 500),
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                  );
                                  // allBeritaProvider.deleteBerita(
                                  //     selectBerita.id, context);
                                  // Navigator.pop(context, HomePage());
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 17, 156, 89),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    EditBerita.routeName,
                                    arguments: selectBerita.id,
                                  );
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 17, 156, 89),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              ]),
        ));
  }
}
