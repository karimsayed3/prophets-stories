import 'package:json_annotation/json_annotation.dart';

part 'series_data.g.dart';

@JsonSerializable()
class SeriesData {
  String? title;
  String? link;
  String? imgUrl;

  SeriesData({this.title, this.link, this.imgUrl});

  factory SeriesData.fromJson(Map<String, dynamic> json) => _$SeriesDataFromJson(json);

  /// Connect the generated [_$SeriesDataToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SeriesDataToJson(this);
}
