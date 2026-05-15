
import 'package:get_it/get_it.dart';
import 'package:varindo_estate_management/cubit/bottom_navigation_bar_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(BottomNavigationBarCubit());
}

void clearLocator() {
  locator.get<BottomNavigationBarCubit>().close();
}