import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;
import 'package:widget_challenge/core/helpers/helpers.dart';
import 'package:widget_challenge/features/home/domain/models/song.dart';
import 'package:widget_challenge/features/navbar/domain/models/nav.dart';

class HomeState extends Equatable {
  final List<Artist> favorites;
  final List<Song> recents;
  final Nav nav;

  HomeState({
    @required this.favorites,
    @required this.recents,
    @required this.nav,
  });

  static HomeState initial() => HomeState(
        favorites: Helpers.favorites,
        recents: Helpers.recent,
        nav: Helpers.nav,
      );

  @override
  List<Object> get props => [favorites, recents, nav];
}
