import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/core/colors/app_colors.dart';
import 'package:widget_challenge/providers.dart' show homeBloc;

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
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
