import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/core/colors/app_colors.dart';
import 'package:widget_challenge/providers.dart' show navBarBloc;
import 'package:widget_challenge/features/navbar/presentation/widgets/widgets.dart'
    show NavBarContentMax, NavBarContentMin;

class NavBarBody extends StatelessWidget {
  const NavBarBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        final state = watch(navBarBloc.state);
        return Padding(
          padding: EdgeInsets.only(bottom: state.padding),
          child: Container(
            height: state.height,
            width: state.width,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(state.borderRadius),
              ),
            ),
            child: state.showControllers
                ? const NavBarContentMax()
                : const NavBarContentMin(),
          ),
        );
      },
    );
  }
}
