import 'series_data_model.dart';
import 'film_data_model.dart';

class Category<T> {
  String id;
  final String title;
  final String backGImg;
  final List<T> items;

  Category({
    required this.id,
    required this.title,
    required this.backGImg,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backGImg': backGImg,
      'id': id,
      'items': items.map((item) {
        if (item is SeriesData) {
          return (item as SeriesData).toMap();
        } else if (item is FilmData) {
          return (item as FilmData).toMap();
        }
        throw ArgumentError('Unknown type');
      }).toList(),
    };
  }

  factory Category.fromMap(Map<String, dynamic> map, String id, Function fromMap) {
    return Category(
      title: map['title'],
      id: map['id'],
      backGImg: map['backGImg'],
      items: List<T>.from(map['items'].map((item) => fromMap(item))),
    );
  }
}