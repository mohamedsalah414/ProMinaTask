// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gallery _$GalleryFromJson(Map<String, dynamic> json) => Gallery(
      status: json['status'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$GalleryToJson(Gallery instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'images': instance.images,
    };
