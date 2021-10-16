import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/storeslist.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Networking', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late Future<StoresList> storesList;
  // late Future<fetchData> fetchData;

  @override
  void initState() {
    super.initState();
    loadData();
    // getStoresList();
    // fetchData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Stores'),
          centerTitle: true,
        ),
        body: Container());
  }
}

Future<http.Response> getData() async {
  const url = 'https://dev.downtown.amifactory.network/api/v1/stores/';
  return await http.get(Uri.parse(url));
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
    }
  }).catchError((error) {
    debugPrint(error.toString());
  });
}
