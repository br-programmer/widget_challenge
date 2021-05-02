import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/navbar/presentation/blocs/controller_state.dart';

class ControllerNotifier extends StateNotifier<ControllerState> {
  ControllerNotifier() : super(ControllerState.initial());

  StreamSubscription<ControllerState> _subscription;
  set suscription(StreamSubscription<ControllerState> sub) =>
      _subscription = sub;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void change(ControllerState value) => state = value;
}
