import 'package:widget_challenge/features/home/domain/models/song.dart';
import 'package:meta/meta.dart' show required;

class Nav {
  const Nav({
    @required this.song,
    @required this.icon,
    @required this.play,
    @required this.randon,
    @required this.stream,
  });

  final Song song;
  final String icon;
  final String play;
  final String randon;
  final String stream;
}
