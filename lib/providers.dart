import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/home/presentation/blocs/controller_notifier.dart';
import 'package:widget_challenge/features/home/presentation/blocs/home_bloc.dart';
import 'package:widget_challenge/features/home/presentation/blocs/nav_bar_bloc.dart';

final homeBloc = StateNotifierProvider<HomeBLoC>((_) => HomeBLoC());

final navBarBloc = StateNotifierProvider<NavBarBLoC>(
  (ref) => NavBarBLoC(controllerNotifier: ref.watch(controllerNotifier)),
);

final controllerNotifier =
    StateNotifierProvider<ControllerNotifier>((_) => ControllerNotifier());
