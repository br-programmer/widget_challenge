import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/core/colors/app_colors.dart';
import 'package:widget_challenge/features/home/domain/models/song.dart';
import 'package:widget_challenge/features/home/presentation/widgets/nav_bar.dart';
import 'package:widget_challenge/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Body(),
            const NavBar(),
          ],
        ),
      ),
    );
  }
}

class NavBarMinChild extends StatelessWidget {
  const NavBarMinChild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final song = context.read(homeBloc.state).listening;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Icon(
            Icons.style_rounded,
            size: kToolbarHeight * .65,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kToolbarHeight),
              child: Image.asset(
                song.img,
                fit: BoxFit.cover,
                height: kToolbarHeight * 1.1,
                width: kToolbarHeight * 1.1,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kToolbarHeight / 2),
              child: Image.asset(
                song.artist.img,
                fit: BoxFit.cover,
                height: kToolbarHeight * .7,
                width: kToolbarHeight * .7,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const Header(),
        const Recently(),
        const RecentSongs(),
      ],
    );
  }
}

class Recently extends StatelessWidget {
  const Recently({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Recently played',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class RecentSongs extends StatelessWidget {
  const RecentSongs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) {
            final song = watch(homeBloc.state).recents[index];
            return ItemRecent(song: song);
          },
          childCount: watch(homeBloc.state).recents.length,
        ),
      ),
    );
  }
}

class ItemRecent extends StatelessWidget {
  const ItemRecent({Key key, @required this.song}) : super(key: key);

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

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Favourite artist',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                ),
              ),
            ),
            const ArtistFavourite()
          ],
        ),
      ),
    );
  }
}

class ArtistFavourite extends StatelessWidget {
  const ArtistFavourite({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (_, constraints) => Consumer(
          builder: (_, watch, __) => ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 20),
            itemCount: watch(homeBloc.state).favorites.length,
            itemBuilder: (_, index) {
              final artist = watch(homeBloc.state).favorites[index];
              return Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: SizedBox(
                  width: constraints.maxHeight * .85,
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: constraints.maxHeight,
                            child: Image.asset(
                              artist.img,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        artist.name,
                        style: TextStyle(
                          color: AppColors.subTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
