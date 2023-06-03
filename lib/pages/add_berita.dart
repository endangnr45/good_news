import 'package:flutter/material.dart';
import 'package:good_news/providers/all_berita.dart';
import 'package:provider/provider.dart';

class AddBerita extends StatelessWidget {
  static const routeName = "/add-berita";
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 17, 156, 89),
        title: Text("Good News", style: TextStyle(fontSize: 31)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              news
                  .addBerita(
                titleController.text,
                descriptionController.text,
                imageController.text,
              )
                  .then(
                (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
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
                            .addBerita(
                          titleController.text,
                          descriptionController.text,
                          imageController.text,
                        )
                            .then(
                          (response) {
                            // print("Kembali ke Home & kasih notif snack bar");
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Berhasil ditambahkan"),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: () {
                          news
                              .addBerita(
                            titleController.text,
                            descriptionController.text,
                            imageController.text,
                          )
                              .then(
                            (response) {
                              // print("Kembali ke Home & kasih notif snack bar");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Berhasil ditambahkan"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Text(
                          "Submit",
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
