import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;
import 'package:widget_challenge/core/helpers/helpers.dart';
import 'package:widget_challenge/features/home/domain/models/song.dart';

class HomeState extends Equatable {
  final List<Artist> favorites;
  final List<Song> recents;
  final Song listening;

  HomeState({
    @required this.favorites,
    @required this.recents,
    @required this.listening,
  });

  static HomeState initial() => HomeState(
        favorites: Helpers.favorites,
        recents: Helpers.recent,
        listening: Helpers.listening,
      );

  HomeState copyWith(
          {List<Artist> favorites,
          List<Song> recents,
          Song listening,
          bool showControllers}) =>
      HomeState(
        favorites: favorites ?? this.favorites,
        recents: recents ?? this.recents,
        listening: listening ?? this.listening,
      );

  @override
  List<Object> get props => [favorites, recents, listening];
}
