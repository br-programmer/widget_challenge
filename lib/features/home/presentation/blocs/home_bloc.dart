import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/home/presentation/blocs/home_state.dart';

class HomeBLoC extends StateNotifier<HomeState> {
  HomeBLoC() : super(HomeState.initial());
}
