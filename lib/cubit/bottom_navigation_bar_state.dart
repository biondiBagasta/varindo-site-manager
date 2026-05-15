part of 'bottom_navigation_bar_cubit.dart';

sealed class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState({
    required this.currentIndex
  });

  final int currentIndex;

  @override
  List<Object> get props => [
    currentIndex
  ];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {

  final int currentIndexState;

  const BottomNavigationBarInitial({ required this.currentIndexState }) : super(currentIndex: currentIndexState);
}
