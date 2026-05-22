import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_light_only_appbars.dart";
import "package:varindo_estate_management/components/texts/main_text_dynamic_component.dart";
import "package:varindo_estate_management/cubit/bottom_navigation_bar_cubit.dart";
import "package:varindo_estate_management/locator.dart";
import "package:varindo_estate_management/screens/tabs_screen/layanan_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/information_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/home_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/marketplace_tab_screen.dart";
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
    InformationTabScreen(),
    LayananTabScreen(),
    ProfileTabScreen(),
    MarketplaceTabScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          onPressed: () {
            locator.get<BottomNavigationBarCubit>().updateState(4);
          },
          backgroundColor: HexColor.fromHex(kPrimaryColor),
          shape: CircleBorder(
            side: BorderSide(
              width: 2.8,
              color: Colors.white
            )
          ),
        
          child: const Icon(LucideIcons.store, color: Colors.white, size: 32,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.transparent,
      appBar: CustomLightOnlyAppbar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: BottomAppBar(
          // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          height: 70,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 1,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        locator.get<BottomNavigationBarCubit>().updateState(0);
                      },
                      child: Ink(
                        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
                          bloc: locator.get<BottomNavigationBarCubit>(),
                          builder: (_, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                state.currentIndex == 0 ? Icon(Iconsax.home5) : Icon(Iconsax.home),
                                SizedBox(height: 4,),
                                MainTextDynamicComponent(text: "Home", fontSize: 12, fontWeight: FontWeight.w500, maxLines: 1,)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        locator.get<BottomNavigationBarCubit>().updateState(1);
                      },
                      child: Ink(
                        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
                          bloc: locator.get<BottomNavigationBarCubit>(),
                          builder: (_, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                state.currentIndex == 1 ? Icon(Iconsax.info_circle5) : Icon(Iconsax.info_circle),
                                SizedBox(height: 4,),
                                MainTextDynamicComponent(text: "Informasi", fontSize: 12, fontWeight: FontWeight.w500, maxLines: 1,)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ),
                  
              SizedBox(width: 48,),
                  
              SizedBox(width: 48,),
          
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        locator.get<BottomNavigationBarCubit>().updateState(2);
                      },
                      child: Ink(
                        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
                          bloc: locator.get<BottomNavigationBarCubit>(),
                          builder: (_, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                state.currentIndex == 2 ? Icon(Iconsax.element_25) : Icon(Iconsax.element_2),
                                SizedBox(height: 4,),
                                MainTextDynamicComponent(text: "Layanan", fontSize: 12, fontWeight: FontWeight.w500, maxLines: 1,)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                
                    InkWell(
                      customBorder: CircleBorder(),
                      onTap: () {
                        locator.get<BottomNavigationBarCubit>().updateState(3);
                      },
                      child: Ink(
                        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
                          bloc: locator.get<BottomNavigationBarCubit>(),
                          builder: (_, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                state.currentIndex == 3 ? Icon(Icons.account_circle) : Icon(Icons.account_circle_outlined),
                                SizedBox(height: 4,),
                                MainTextDynamicComponent(text: "Akun", fontSize: 12, fontWeight: FontWeight.w500, maxLines: 1,)
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
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
