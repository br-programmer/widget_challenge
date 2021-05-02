import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/core/colors/app_colors.dart';
import 'package:widget_challenge/features/home/presentation/blocs/nav_bar_bloc.dart';
import 'package:widget_challenge/features/home/presentation/blocs/nav_bar_state.dart';
import 'package:widget_challenge/features/home/presentation/screens/home_screen.dart';
import 'package:widget_challenge/providers.dart';

final _duration = const Duration(milliseconds: 600);

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  NavBarBLoC _navBarBLoC;
  ControllerNotifier _controllerNotifier;
  CurvedAnimation _animation;

  @override
  void initState() {
    _navBarBLoC = context.read(navBarBloc);
    _controllerNotifier = context.read(controllerNotifier);
    _controllerNotifier.suscription =
        _controllerNotifier.stream.listen(_listener);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _navBarBLoC.size = MediaQuery.of(context).size,
    );
    _controller = AnimationController(vsync: this, duration: _duration);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInCubic);
    _controller.addListener(_controllerListener);
    super.initState();
  }

  void _listener(ControllerState event) {
    if (event.forward) {
      _controller.forward(from: event.from);
    } else {
      _controller.reverse(from: event.from);
    }
  }

  void _controllerListener() {
    _navBarBLoC.listenAnimation(_animation.value);
  }

  @override
  void dispose() {
    _controller?.removeListener(_controllerListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: const NavBarBody(),
    );
  }
}

class NavBarBody extends StatelessWidget {
  const NavBarBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) {
        final state = watch(navBarBloc.state);
        final navBarBLoC = context.read(navBarBloc);
        return GestureDetector(
          onVerticalDragEnd: navBarBLoC.onVerticalDragEnd,
          onVerticalDragUpdate: navBarBLoC.onVerticalDragUpdate,
          onTap: navBarBLoC.onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: state.margin),
            height: state.height,
            width: state.width,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(state.borderRadius),
              ),
              gradient: state.showControllers
                  ? AppColors.gradient
                  : AppColors.gradientTwo,
            ),
            child: const NavBarMinChild(),
          ),
        );
      },
    );
  }
}
