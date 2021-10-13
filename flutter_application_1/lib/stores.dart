import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class StoresList {
  List<Store> stores;
  StoresList({this.stores});

  factory StoresList.fromJson(Map<String, dynamic> json) {
    var storesJson = json['results'] as List;
    List<Store> storesList = storesJson.map((i) => Store.fromJson(i)).toList();

    return StoresList(stores: storesList);
  }
}

class Store {
  final String title;
  final String preview_url;

  Store({this.title, this.preview_url});

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      title: json['title'] as String,
      preview_url: json['preview_url'] as String,
    );
  }
}

Future<StoresList> getStoresList() async {
  const url = 'https://dev.downtown.amifactory.network/api/v1/stores/';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return StoresList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
