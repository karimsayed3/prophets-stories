
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class Product {
  String? id;
  String? title;
  String? desc;
  String? color;

  Product({this.id, this.title, this.desc, this.color});

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}