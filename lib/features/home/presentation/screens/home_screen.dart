import 'package:flutter/material.dart';
import 'package:widget_challenge/features/home/presentation/widgets/widgets.dart'
    show Body;
import 'package:widget_challenge/features/navbar/presentation/widgets/nav_bar.dart';

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
