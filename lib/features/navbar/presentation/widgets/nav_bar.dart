import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/navbar/presentation/blocs/blocs.dart'
    show NavBarBLoC, ControllerState;
import 'package:widget_challenge/features/navbar/presentation/widgets/widgets.dart'
    show NavBarBody;
import 'package:widget_challenge/providers.dart'
    show navBarBloc, controllerNotifier;

final _duration = const Duration(milliseconds: 600);

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  NavBarBLoC _navBarBLoC;
  CurvedAnimation _animation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_init);
    super.initState();
  }

  void _init(_) {
    final controller = context.read(controllerNotifier);
    controller.suscription = controller.stream.listen(_listener);
    _navBarBLoC = context.read(navBarBloc);
    _navBarBLoC.size = MediaQuery.of(context).size;
    _controller = AnimationController(vsync: this, duration: _duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInCubic)
      ..addListener(_animationListener);
  }

  void _listener(ControllerState state) {
    if (state.forward)
      _controller.forward(from: state.from);
    else
      _controller.reverse(from: state.from);
  }

  void _animationListener() => _navBarBLoC.listenAnimation(_animation.value);

  @override
  void dispose() {
    _animation?.removeListener(_animationListener);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navBloc = context.read(navBarBloc);
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragEnd: navBloc.onVerticalDragEnd,
        onVerticalDragUpdate: navBloc.onVerticalDragUpdate,
        child: const NavBarBody(),
      ),
    );
  }
}
