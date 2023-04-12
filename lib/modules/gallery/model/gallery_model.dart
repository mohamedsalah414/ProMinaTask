
import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class Gallery {
  Gallery({
    required this.status,
    required this.data,
    required this.message,
  });
  late final String status;
  late final Data data;
  late final String message;

  factory Gallery.fromJson(Map<String, dynamic> json) => _$GalleryFromJson(json);


  Map<String, dynamic> toJson() => _$GalleryToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.images,
  });
  late final List<String> images;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);


  Map<String, dynamic> toJson() => _$DataToJson(this);
}