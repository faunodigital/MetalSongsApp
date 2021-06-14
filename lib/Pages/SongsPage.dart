import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'PlayerPage.dart';
import 'package:metal_songs/Models/Music.dart';

class SongsPage extends StatefulWidget {
  SongsPage({Key? key, required this.songs}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final List<Song> songs;

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {


  @override
  Widget build(BuildContext context) {
  List<Song> songs = widget.songs;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(""),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: songs == null ? 0 : songs.length,
                itemBuilder: (BuildContext context, int index) {

                  var name = songs[index].title;

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
                              new MaterialPageRoute(builder: (context) => PlayerPage(song:songs[index]))
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
