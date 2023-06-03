import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../models/news.dart';

class News with ChangeNotifier {
  List<Berita> _allBerita = [];

  List<Berita> get allBerita => _allBerita;

  int get jumlahBerita => _allBerita.length;

  Berita selectById(String id) =>
      _allBerita.firstWhere((element) => element.id == id);

  Future<void> addBerita(String title, String description, String urlToImage) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://good-news-cea06-default-rtdb.firebaseio.com/news.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          "title": title,
          "description": description,
          "urlToImage": urlToImage,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _allBerita.add(
          Berita(
            id: json.decode(response.body)["name"].toString(),
            title: title,
            description: description,
            urlToImage: urlToImage,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  Future<void> editBerita(
    String id,
    String title,
    String description,
    String urlToImage,
  ) {
    DateTime datetimeNow = DateTime.now();
    Uri url = Uri.parse(
        "https://good-news-cea06-default-rtdb.firebaseio.com/news/$id.json");
    return http
        .put(
      url,
      body: json.encode(
        {
          "title": title,
          "description": description,
          "urlToImage": urlToImage,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        Berita selectBerita =
          _allBerita.firstWhere((element) => element.id == id);
        selectBerita.title = title;
        selectBerita.description = description;
        selectBerita.urlToImage = urlToImage;

        notifyListeners();
      },
    );
  }

  Future<void> deleteBerita(String id) {
    Uri url = Uri.parse(
        "https://good-news-cea06-default-rtdb.firebaseio.com/news/$id.json");
    return http.delete(url).then(
      (response) {
        _allBerita.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }

  Future<void> initialData() async {
    _allBerita = [];
    Uri url = Uri.parse(
        "https://good-news-cea06-default-rtdb.firebaseio.com/news.json");

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

    dataResponse.forEach(
      (key, value) {
        DateTime dateTimeParse =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
        Berita berita = Berita(
          id: key,
            createdAt: dateTimeParse,
            title: value["title"],
            urlToImage: value["urlToImage"],
            description: value["description"],
        );
        // _allBerita.add(
        //   Berita(
        //     id: key,
        //     createdAt: dateTimeParse,
        //     title: value["title"],
        //     urlToImage: value["urlToImage"],
        //     description: value["description"],
        //   ),
        // );
        _allBerita.add(berita);
      },
    );
    print("BERHASIL MASUKAN DATA LIST");

    notifyListeners();
  }
}
