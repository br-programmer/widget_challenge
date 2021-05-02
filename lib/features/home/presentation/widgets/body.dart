import 'package:flutter/material.dart';
import 'package:widget_challenge/features/home/presentation/widgets/widgets.dart'
    show Header, Recently, RecentlySongs;

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        const Header(),
        const Recently(),
        const RecentlySongs(),
      ],
    );
  }
}
