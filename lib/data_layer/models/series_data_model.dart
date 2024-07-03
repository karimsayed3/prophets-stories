class SeriesData {
  final String title;
  final String link;
  final String imgUrl;

  SeriesData({required this.title, required this.link, required this.imgUrl});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'link': link,
      'imgUrl': imgUrl,
    };
  }

  factory SeriesData.fromMap(Map<String, dynamic> map) {
    return SeriesData(
      title: map['title'],
      link: map['link'],
      imgUrl: map['imgUrl'],
    );
  }
}