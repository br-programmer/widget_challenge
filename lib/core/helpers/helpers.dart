import 'package:widget_challenge/features/home/domain/models/song.dart';
import 'package:widget_challenge/features/navbar/domain/models/nav.dart';

const _pathImages = 'assets/images/';
const _pathIcons = 'assets/icons/';

class Helpers {
  static List<Artist> favorites = const [
    Artist(name: 'A\$ap Rocky', img: '${_pathImages}person1.png'),
    Artist(name: 'EDX', img: '${_pathImages}person2.png'),
    Artist(name: 'Bloody Tear', img: '${_pathImages}person3.png'),
    Artist(name: 'Other', img: '${_pathImages}person4.png'),
  ];
  static List<Song> recent = [
    Song(
      title: 'Lxst Cxntury',
      artist: Helpers.favorites[0],
      img: '${_pathImages}img2.png',
    ),
    Song(
      title: '\$ucideBoy\$',
      artist: Helpers.favorites[1],
      img: '${_pathImages}img1.png',
    ),
    Song(
      title: 'Health/Beauty',
      artist: Helpers.favorites[2],
      img: '${_pathImages}img3.png',
    ),
    Song(
      title: 'Music',
      artist: Helpers.favorites[3],
      img: '${_pathImages}img4.png',
    ),
  ];

  static Nav nav = Nav(
    song: recent[0],
    icon: '${_pathIcons}icon_cards.png',
    randon: '${_pathIcons}icon_random.png',
    play: '${_pathIcons}icon_pause.png',
    stream: '${_pathIcons}icon_stream.png',
  );
}
