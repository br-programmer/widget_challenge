import 'package:meta/meta.dart' show required;

class Song {
  const Song({@required this.title, @required this.artist, @required this.img});

  final String title;
  final Artist artist;
  final String img;
}

class Artist {
  const Artist({@required this.name, @required this.img});

  final String name;
  final String img;
}
