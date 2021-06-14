

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:metal_songs/Pages/SongsPage.dart';
import 'package:metal_songs/Models/Music.dart';

class GenrasPage extends StatefulWidget {
  GenrasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GenrasPageState createState() => _GenrasPageState();
}

class _GenrasPageState extends State<GenrasPage> {
  List<Genra> _genras = [];

  Future<String> _getGenras() async {
    var response = await rootBundle.loadString('assets/json/music.json');
    var data = await json.decode(response);
    List<Genra> genras = [];
    for(var g in data["Genras"]){
      Genra genra = Genra.fromJson(g);
      genras.add(genra);

    }
    setState(() => _genras = genras);
    return "ok";
  }

  @override
  void initState() {
    super.initState();
    this._getGenras();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Metal Songs App"),),
      body: Center(
        child: ListView.builder(
            itemCount: _genras == null ? 0 : _genras.length,
            itemBuilder: (BuildContext context, int index) {

              var name = _genras[index].name;

              return new Column(
                children: <Widget>[
                  new ListTile(
                    leading: CircleAvatar(
                      child: new Icon(Icons.account_box),
                    ),
                    title: Text(name),
                    subtitle: Text(name),
                    onTap: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => SongsPage(songs:_genras[index].songs))
                      );
                    },
                  ),
                  new Divider(),
                ],
              );
            })
      ),

    );
  }
}
