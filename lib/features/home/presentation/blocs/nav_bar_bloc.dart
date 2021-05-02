import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/home/presentation/blocs/controller_notifier.dart';
import 'package:widget_challenge/features/home/presentation/blocs/nav_bar_state.dart';

const _radius = 20.0;

class NavBarBLoC extends StateNotifier<NavBarState> {
  NavBarBLoC({@required this.controllerNotifier})
      : super(NavBarState.initial());

  final ControllerNotifier controllerNotifier;

  Size _screenSize;
  Size get screenSize => _screenSize;
  double _minHeight;
  double _maxHeight;
  double _currentHeight;
  set size(Size size) {
    _screenSize = size;
    _minHeight = size.height * .1;
    _maxHeight = size.height * .6;
    _currentHeight = _maxHeight;
    state = state.copyWith(
      height: _minHeight,
      width: _screenSize.width * .6,
    );
  }

  void onVerticalDragEnd(DragEndDetails details) {
    if (_currentHeight < _maxHeight / 2) {
      state = state.copyWith(showControllers: false);
      controllerNotifier.change(
        controllerNotifier.state
            .copyWith(forward: false, from: _currentHeight / _maxHeight),
      );
      _currentHeight = _maxHeight;
    } else {
      controllerNotifier.change(
        controllerNotifier.state
            .copyWith(from: _currentHeight / _maxHeight, forward: true),
      );
      state = state.copyWith(showControllers: true);
      _currentHeight = _maxHeight;
    }
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    if (state.showControllers) {
      final newHeight = _currentHeight - details.delta.dy;
      final borderMargin = lerpDouble(_radius, 0, _currentHeight / _maxHeight);
      final newWidth = lerpDouble(
        _screenSize.width * .6,
        _screenSize.width,
        _currentHeight / _maxHeight,
      );
      _currentHeight = newHeight.clamp(_minHeight, _maxHeight);
      state = state.copyWith(
        height: _currentHeight,
        borderRadius: borderMargin,
        margin: borderMargin,
        width: newWidth,
      );
    }
  }

  void listenAnimation(double value) {
    if (_currentHeight != null) {
      state = state.copyWith(
        borderRadius: lerpDouble(_radius, 0, value),
        height: lerpDouble(_minHeight, _currentHeight, value),
        margin: lerpDouble(_radius, 0, value),
        width: lerpDouble(_screenSize.width * .6, _screenSize.width, value),
      );
    }
  }

  void onTap() {
    controllerNotifier.change(controllerNotifier.state.copyWith(forward: true));
    state = state.copyWith(showControllers: true);
  }
}
