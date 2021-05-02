import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/core/colors/app_colors.dart';
import 'package:widget_challenge/providers.dart' show homeBloc, navBarBloc;

class NavBarContentMax extends StatelessWidget {
  const NavBarContentMax({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = context.read(homeBloc.state).nav;
    return Consumer(
      builder: (_, watch, child) =>
          Opacity(opacity: 1 - watch(navBarBloc.state).percent, child: child),
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            Align(
              child: Container(
                width: 50,
                height: 7.5,
                decoration: BoxDecoration(
                  color: AppColors.subTextColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  nav.song.img,
                  width: MediaQuery.of(context).size.width * .3,
                  height: MediaQuery.of(context).size.width * .3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              nav.song.title,
              style: TextStyle(
                color: Colors.white.withOpacity(.6),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              nav.song.artist.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Align(
                child: Container(
                  height: 40,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(nav.randon, width: 30),
                Image.asset(nav.play, width: 30),
                Image.asset(nav.stream, width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
