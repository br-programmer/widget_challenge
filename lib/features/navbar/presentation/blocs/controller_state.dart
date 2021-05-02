import 'package:meta/meta.dart' show required;
import 'package:equatable/equatable.dart';

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
