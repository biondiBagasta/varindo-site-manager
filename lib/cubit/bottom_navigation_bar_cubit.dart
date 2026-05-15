import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial(currentIndexState: 0));

  void updateState(int index) {
    emit(BottomNavigationBarInitial(currentIndexState: index));
  }
}
