import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

class NavBarState extends Equatable {
  const NavBarState({
    @required this.width,
    @required this.height,
    @required this.showControllers,
    @required this.margin,
    @required this.borderRadius,
  });

  final double width;
  final double height;
  final bool showControllers;
  final double margin;
  final double borderRadius;

  NavBarState copyWith({
    double width,
    double height,
    bool showControllers,
    double margin,
    double borderRadius,
  }) =>
      NavBarState(
        width: width ?? this.width,
        height: height ?? this.height,
        showControllers: showControllers ?? this.showControllers,
        margin: margin ?? this.margin,
        borderRadius: borderRadius ?? this.borderRadius,
      );

  static NavBarState initial() => NavBarState(
        width: 0,
        height: 0,
        showControllers: false,
        margin: 20,
        borderRadius: 20,
      );

  @override
  List<Object> get props => [
        width,
        height,
        showControllers,
        margin,
        borderRadius,
      ];
}

class ControllerState extends Equatable {
  const ControllerState({@required this.forward, @required this.from});

  final bool forward;
  final double from;

  static ControllerState initial() => ControllerState(forward: false, from: 0);

  ControllerState copyWith({bool forward, double from}) => ControllerState(
        forward: forward ?? this.forward,
        from: from ?? this.from,
      );

  @override
  List<Object> get props => [forward, from];
}
