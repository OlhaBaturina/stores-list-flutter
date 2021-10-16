// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storeslist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoresList _$StoresListFromJson(Map<String, dynamic> json) => StoresList(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoresListToJson(StoresList instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      title: json['title'] as String,
      pictureMedia:
          PictureMedia.fromJson(json['pictureMedia'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'title': instance.title,
      'pictureMedia': instance.pictureMedia,
    };

PictureMedia _$PictureMediaFromJson(Map<String, dynamic> json) => PictureMedia(
      previewUrl: json['previewUrl'] as String,
    );

Map<String, dynamic> _$PictureMediaToJson(PictureMedia instance) =>
    <String, dynamic>{
      'previewUrl': instance.previewUrl,
    };
