import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/storeslist.dart';

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
      body: FutureBuilder<StoresList>(
        future: getStoresList(),
        builder: (context, snapshot) {
          final stores = snapshot.data;
          if (stores?.results.isEmpty ?? true) {
            return Container(
              alignment: Alignment.center,
              child: Text("Loading"),
            );
          }

          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final item = stores?.results[index];
              if (item == null) {
                return Container();
              }

              return Card(
                margin: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 100.0,
                  height: 150.0,
                  child: Stack(
                    children: [
                      item.pictureMedia?.previewUrl != null ? Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: NetworkImage(item.pictureMedia!.previewUrl!),
                          fit: BoxFit.cover,
                        ),
                        ), //BorderRadius.all
                      ) : Container(),
                      Center(
                        child: Text(
                          item.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ), //BoxDecoration
              );
            },
            itemCount: stores?.results.length ?? 0,
          );
        }
      ),
    );
    //
  }
}
