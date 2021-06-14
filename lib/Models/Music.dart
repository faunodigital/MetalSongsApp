class Song {
  int id;
  String band;
  double duration;
  String title;
  String url;

  Song({
    required this.id,
    required this.band,
    required this.duration,
    required this.title,
    required this.url
  });

  factory Song.fromJson(Map<String, dynamic> json){
    return Song(
        id: json['id'] as int,
        band: json['band'] as String,
        duration: json['duration'] as double,
        title: json['title'] as String,
        url: json['url'] as String
    );
  }
}

class Genra {
  String name;
  List<Song> songs = [];

  Genra({
    required this.name,
    required this.songs
  });

  factory Genra.fromJson(Map<String, dynamic> json) {
    List<Song> songs = (json['Songs'] as List).map((i) { return Song.fromJson(i);}).toList();

    return new Genra(
      name: json['Name'] as String,
      songs: songs,
    );
  }
}

