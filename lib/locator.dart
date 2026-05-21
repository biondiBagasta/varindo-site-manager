
import 'package:get_it/get_it.dart';
import 'package:varindo_estate_management/cubit/bottom_navigation_bar_cubit.dart';
import 'package:varindo_estate_management/cubit/server_cubit.dart';
import 'package:varindo_estate_management/services/adamulti_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Singleton
  locator.registerSingleton(BottomNavigationBarCubit());
  locator.registerSingleton(ServerCubit());

  // Lazy Singleton
  locator.registerLazySingleton(() => AdamultiService());
}

void clearLocator() {
  locator.get<BottomNavigationBarCubit>().close();
  locator.get<ServerCubit>().close();
}