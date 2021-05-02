import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/navbar/presentation/blocs/controller_notifier.dart';
import 'package:widget_challenge/features/navbar/presentation/blocs/nav_bar_state.dart';

const _radius = 20.0;
const _percent = 1.0;
double _minHeight;
double _maxHeight;
double _currentHeight;
Size _screenSize;

class NavBarBLoC extends StateNotifier<NavBarState> {
  NavBarBLoC({@required this.controllerNotifier})
      : super(NavBarState.initial());

  final ControllerNotifier controllerNotifier;

  set size(Size size) {
    _screenSize = size;
    _minHeight = size.height * .1;
    _maxHeight = size.height * .5;
    _currentHeight = _maxHeight;
    state = state.copyWith(
      height: _minHeight,
      width: _screenSize.width * .6,
    );
  }

  void onVerticalDragEnd(DragEndDetails details) {
    if (state.showControllers) {
      if (_currentHeight < _maxHeight / 1.5) {
        state = state.copyWith(showControllers: false);
        controllerNotifier.change(
          controllerNotifier.state
              .copyWith(forward: false, from: _currentHeight / _maxHeight),
        );
        _currentHeight = _maxHeight;
      } else {
        state = state.copyWith(showControllers: true);
        controllerNotifier.change(
          controllerNotifier.state
              .copyWith(from: _maxHeight / _currentHeight, forward: true),
        );
        _currentHeight = _maxHeight;
      }
    }
  }

  void onVerticalDragUpdate(DragUpdateDetails details) {
    final newHeight = _currentHeight - details.delta.dy;
    final borderMargin = lerpDouble(_radius, 0.0, _currentHeight / _maxHeight);
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
      percent: lerpDouble(_percent, 0.0, _currentHeight / _maxHeight),
    );
  }

  void listenAnimation(double value) {
    if (_currentHeight != null) {
      state = state.copyWith(
          borderRadius: lerpDouble(_radius, 0.0, value),
          height: lerpDouble(_minHeight, _currentHeight, value),
          margin: lerpDouble(_radius, 0.0, value),
          width: lerpDouble(_screenSize.width * .6, _screenSize.width, value),
          percent: lerpDouble(_percent, 0.0, value));
    }
  }

  void onTap() {
    controllerNotifier.change(controllerNotifier.state.copyWith(forward: true));
    state = state.copyWith(showControllers: true);
  }
}
