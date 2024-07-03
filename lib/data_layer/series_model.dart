import 'package:json_annotation/json_annotation.dart';
import 'package:muslim/data_layer/series_data.dart';

part 'series_model.g.dart';

@JsonSerializable()
class Series {
  String? title;
  String? backGImg;
  List<SeriesData>? series;

  Series({this.title,this.backGImg, this.series});

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);

  /// Connect the generated [_$SeriesToJson] function to the `toJson` method. 
  Map<String, dynamic> toJson() => _$SeriesToJson(this);
}

