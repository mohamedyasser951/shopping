import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  int currentIndex = 0;
  void changeBottomNavIndex({required int newIndex}) {
    currentIndex = newIndex;
    emit(ChangeBottomNavState());
  }
}
