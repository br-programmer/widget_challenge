import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/home/domain/models/song.dart';
import 'package:widget_challenge/providers.dart' show homeBloc;

class RecentlySongs extends StatelessWidget {
  const RecentlySongs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) =>
              ItemRecently(song: watch(homeBloc.state).recents[index]),
          childCount: watch(homeBloc.state).recents.length,
        ),
      ),
    );
  }
}

class ItemRecently extends StatelessWidget {
  const ItemRecently({Key key, @required this.song}) : super(key: key);

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        height: 350,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(song.img, fit: BoxFit.cover),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          song.artist.img,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        song.title,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.6),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        song.artist.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
