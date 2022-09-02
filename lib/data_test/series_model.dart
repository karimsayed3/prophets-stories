import 'package:json_annotation/json_annotation.dart';
import 'package:muslim/data_test/series_data.dart';

part 'series_model.g.dart';

@JsonSerializable()
class Series {
  String? title;
  @JsonKey(name: '_id')
  dynamic id;
  String? backGImg;
  List<SeriesData>? series;

  Series({this.title,this.id, this.backGImg, this.series});

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  /// Connect the generated [_$SeriesToJson] function to the `toJson` method. 
  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

