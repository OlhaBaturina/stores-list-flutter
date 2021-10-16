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
        backgroundColor: Colors.white,
        title: const Text('Stores'),
        centerTitle: false,
        titleTextStyle: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 26,
            fontWeight: FontWeight.w400),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 15.0),

            child: Container(
              child: Center(
                child: Text(
                  "Store.name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              height: 150.0,
              width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://downtown-dev.fra1.digitaloceanspaces.com/media/public/uploads/06d74d27-82a6-4c85-b3d2-819f481acfa1.jpg'),
                  fit: BoxFit.fill,
                ),
              ), //BorderRadius.all
            ), //BoxDecoration
          );
        },
        itemCount: 10,
      ),
    );
    //
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
