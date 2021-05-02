import 'package:widget_challenge/features/home/domain/models/song.dart';

class Helpers {
  static List<Artist> favorites = const [
    Artist(name: 'A\$ap Rocky', img: 'assets/images/person1.png'),
    Artist(name: 'EDX', img: 'assets/images/person2.png'),
    Artist(name: 'Bloody Tear', img: 'assets/images/person3.png'),
    Artist(name: 'Other', img: 'assets/images/person4.png'),
  ];
  static List<Song> recent = [
    Song(
      title: 'Lxst Cxntury',
      artist: Helpers.favorites[0],
      img: 'assets/images/img2.png',
    ),
    Song(
      title: '\$ucideBoy\$',
      artist: Helpers.favorites[1],
      img: 'assets/images/img1.png',
    ),
    Song(
      title: 'Health/Beauty',
      artist: Helpers.favorites[2],
      img: 'assets/images/img3.png',
    ),
    Song(
      title: 'Music',
      artist: Helpers.favorites[3],
      img: 'assets/images/img4.png',
    ),
  ];

  static Song listening = recent[0];
}
