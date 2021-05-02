import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart' show required;

class NavBarState extends Equatable {
  const NavBarState({
    @required this.width,
    @required this.height,
    @required this.showControllers,
    @required this.padding,
    @required this.borderRadius,
    @required this.percent,
  });

  final double width;
  final double height;
  final bool showControllers;
  final double padding;
  final double borderRadius;
  final double percent;

  NavBarState copyWith({
    double width,
    double height,
    bool showControllers,
    double margin,
    double borderRadius,
    double percent,
  }) =>
      NavBarState(
        width: width ?? this.width,
        height: height ?? this.height,
        showControllers: showControllers ?? this.showControllers,
        padding: margin ?? this.padding,
        borderRadius: borderRadius ?? this.borderRadius,
        percent: percent ?? this.percent,
      );

  static NavBarState initial() => NavBarState(
        width: 0.0,
        height: 0.0,
        showControllers: false,
        padding: 20.0,
        borderRadius: 20.0,
        percent: 1.0,
      );

  @override
  List<Object> get props => [
        width,
        height,
        showControllers,
        padding,
        borderRadius,
        percent,
      ];
}
