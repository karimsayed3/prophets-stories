class FilmData {
  String id;
  String title;
  String link;
  String imgUrl;

  FilmData({
    required this.id,
    required this.title,
    required this.link,
    required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'imgUrl': imgUrl,
    };
  }

  static FilmData fromMap(Map<String, dynamic> map, String id) {
    return FilmData(
      id: id,
      title: map['title'],
      link: map['link'],
      imgUrl: map['imgUrl'],
    );
  }
}

