import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/providers.dart' show homeBloc, navBarBloc;

class NavBarContentMin extends StatelessWidget {
  const NavBarContentMin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = context.read(homeBloc.state).nav;
    return Consumer(
      builder: (_, watch, child) => Opacity(
        opacity: watch(navBarBloc.state).percent,
        child: child,
      ),
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        tween: Tween(begin: .7, end: 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Align(
                child: Image.asset(
                  nav.icon,
                  fit: BoxFit.cover,
                  height: kToolbarHeight * .55,
                  width: kToolbarHeight * .55,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: GestureDetector(
                  onTap: context.read(navBarBloc).onTap,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kToolbarHeight),
                    child: Image.asset(
                      nav.song.img,
                      fit: BoxFit.cover,
                      height: kToolbarHeight * 1.1,
                      width: kToolbarHeight * 1.1,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kToolbarHeight / 2),
                  child: Image.asset(
                    nav.song.artist.img,
                    fit: BoxFit.cover,
                    height: kToolbarHeight * .6,
                    width: kToolbarHeight * .6,
                  ),
                ),
              ),
            ),
          ],
        ),
        builder: (_, value, child) =>
            Transform.scale(scale: value, child: child),
      ),
    );
  }
}
