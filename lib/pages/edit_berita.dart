import 'package:flutter/material.dart';
import 'package:good_news/providers/all_berita.dart';
import 'package:provider/provider.dart';

class EditBerita extends StatelessWidget {
  static const routeName = "/edit-berita";

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context, listen: false);
    final newsId = ModalRoute.of(context)?.settings.arguments as String;
    final selectBerita = news.selectById(newsId);
    final TextEditingController imageController =
        TextEditingController(text: selectBerita.urlToImage);
    final TextEditingController titleController =
        TextEditingController(text: selectBerita.title);
    final TextEditingController descriptionController =
        TextEditingController(text: selectBerita.description);
    return Scaffold(
      appBar: AppBar(
        title: Text("Good News",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 31,
              fontFamily: 'Alata Reguler',
            )),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 17, 156, 89),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageController.text),
                    ),
                  ),
                ),
              ),
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Judul Berita",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      autocorrect: false,
                      autofocus: true,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Tulis judul berita di sini",
                        focusColor: Color.fromARGB(255, 17, 156, 89),
                        hoverColor: Color.fromARGB(255, 17, 156, 89),
                        // icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        fillColor: Color(
                          0xfff3f3f4,
                        ),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Deskripsi Berita",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      autocorrect: false,
                      autofocus: true,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "Tulis deskripsi berita di sini",
                        focusColor: Color.fromARGB(255, 17, 156, 89),
                        hoverColor: Color.fromARGB(255, 17, 156, 89),
                        // icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        fillColor: Color(
                          0xfff3f3f4,
                        ),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // color: Colors.amber,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Url Gambar Berita",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      autocorrect: false,
                      autofocus: true,
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      controller: imageController,
                      decoration: InputDecoration(
                        hintText: "Url gambar berita",
                        // focusColor: Color.fromARGB(255, 17, 156, 89),
                        // hoverColor: Color.fromARGB(255, 17, 156, 89),
                        // icon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        fillColor: Color(
                          0xfff3f3f4,
                        ),
                        filled: true,
                      ),
                      onEditingComplete: () {
                        news
                            .editBerita(
                          newsId,
                          titleController.text,
                          descriptionController.text,
                          imageController.text,
                        )
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil diubah"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        });
                      },
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: () {
                          news
                              .editBerita(
                            newsId,
                            titleController.text,
                            descriptionController.text,
                            imageController.text,
                          )
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Berhasil diubah"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 17, 156, 89),
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
    );
  }
}
