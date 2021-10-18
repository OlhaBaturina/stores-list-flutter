import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'storeslist.g.dart';

@JsonSerializable()
class StoresList {
  StoresList({
    required this.results,
  });

  List<Result> results;

  factory StoresList.fromJson(Map<String, dynamic> json) =>
      _$StoresListFromJson(json);

  Map<String, dynamic> toJson() => _$StoresListToJson(this);
}

@JsonSerializable()
class Result {
  Result({
    required this.title,
    required this.pictureMedia,
  });

  final String title;

  @JsonKey(name: "picture_media")
  final PictureMedia? pictureMedia;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class PictureMedia {
  PictureMedia({
    required this.previewUrl,
  });

  @JsonKey(name: "preview_url")
  final String? previewUrl;

  factory PictureMedia.fromJson(Map<String, dynamic> json) =>
      _$PictureMediaFromJson(json);

  Map<String, dynamic> toJson() => _$PictureMediaToJson(this);
}

Future<StoresList> getStoresList() async {
  const url = 'https://dev.downtown.amifactory.network/api/v1/stores/';
  final response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
      return StoresList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error: ${response.reasonPhrase}');
    }
  } catch (err) {
    print(err);
    throw Exception('Error: ${err.hashCode}');
  }
}
