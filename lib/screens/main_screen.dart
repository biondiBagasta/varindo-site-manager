import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:iconsax/iconsax.dart";
import "package:varindo_estate_management/components/appbars/custom_light_only_appbars.dart";
import "package:varindo_estate_management/cubit/bottom_navigation_bar_cubit.dart";
import "package:varindo_estate_management/locator.dart";
import "package:varindo_estate_management/screens/tabs_screen/cluster_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/layanan_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/home_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/profile_tab_screen.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MainScreen extends StatefulWidget {

  const MainScreen({ super.key });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final screenTabList = [
    HomeTabScreen(),
    ClusterTabScreen(),
    LayananTabScreen(),
    ProfileTabScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomLightOnlyAppbar(),
      bottomNavigationBar: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        bloc: locator.get<BottomNavigationBarCubit>(),
        builder: (_, state) {
          return NavigationBar(
            surfaceTintColor: HexColor.fromHex(kPrimaryColor),
            backgroundColor: Colors.white,
            selectedIndex: state.currentIndex,
            // labelTextStyle: WidgetStateTextStyle.resolveWith(
            //   (state) {
            //     if(state.contains(WidgetState.selected)) {
            //       return GoogleFonts.inter(
            //         color: Colors.white
            //       );
            //     } else {
            //       return GoogleFonts.inter(
            //         color: HexColor.fromHex(kTextColor)
            //       );
            //     }
            //   }
            // ),
            onDestinationSelected: (index) {
              locator.get<BottomNavigationBarCubit>().updateState(index);
            },
            indicatorColor: HexColor.fromHex(kPrimaryColor),
            destinations: [
              NavigationDestination(
                selectedIcon: Icon(Iconsax.home5, color: Colors.white,),
                icon: Icon(Iconsax.home), 
                label: "Home"
              ),
              NavigationDestination(
                selectedIcon: Icon(Iconsax.grid_35, color: Colors.white,),
                icon: Icon(Iconsax.grid_3), 
                label: "Cluster"
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.groups_2, color: Colors.white,),
                icon: Icon(Icons.groups_2_outlined), 
                label: "Kluster"
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.account_circle, color: Colors.white,),
                icon: Icon(Icons.account_circle_outlined), 
                label: "Profil"
              ),
            ]
          );
        }
      ),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: double.infinity,
            child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
              bloc: locator.get<BottomNavigationBarCubit>(),
              builder: (_, state) {
                return screenTabList[state.currentIndex];
              }
            ),
          ),
        ),
      ),
    );
  }
}
