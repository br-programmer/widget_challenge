import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_challenge/features/home/presentation/blocs/blocs.dart'
    show HomeState;

class HomeBLoC extends StateNotifier<HomeState> {
  HomeBLoC() : super(HomeState.initial());
}
