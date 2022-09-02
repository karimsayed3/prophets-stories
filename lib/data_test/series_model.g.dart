// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Series _$SeriesFromJson(Map<String, dynamic> json) => Series(
      title: json['title'] as String?,
      id: json['_id'],
      backGImg: json['backGImg'] as String?,
      series: (json['series'] as List<dynamic>?)
          ?.map((e) => SeriesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesToJson(Series instance) => <String, dynamic>{
      'title': instance.title,
      '_id': instance.id,
      'backGImg': instance.backGImg,
      'series': instance.series,
    };
