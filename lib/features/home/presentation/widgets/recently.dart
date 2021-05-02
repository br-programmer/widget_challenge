import 'package:flutter/material.dart';
import 'package:widget_challenge/core/colors/app_colors.dart';

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
