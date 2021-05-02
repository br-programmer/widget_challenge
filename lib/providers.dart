import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/home/presentation/blocs/blocs.dart'
    show HomeBLoC;
import 'package:widget_challenge/features/navbar/presentation/blocs/blocs.dart'
    show NavBarBLoC, ControllerNotifier;

final homeBloc = StateNotifierProvider<HomeBLoC>((_) => HomeBLoC());

final navBarBloc = StateNotifierProvider<NavBarBLoC>(
  (ref) => NavBarBLoC(controllerNotifier: ref.watch(controllerNotifier)),
);

final controllerNotifier =
    StateNotifierProvider<ControllerNotifier>((_) => ControllerNotifier());
