class Berita {
  String id;
  String title;
  String description;
  String urlToImage;
  DateTime createdAt;

  Berita({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.urlToImage, 
    required this.createdAt});
}