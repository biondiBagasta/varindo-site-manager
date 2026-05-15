import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_light_only_appbars.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/cubit/bottom_navigation_bar_cubit.dart";
import "package:varindo_estate_management/locator.dart";
import "package:varindo_estate_management/screens/tabs_screen/bantuan_tab_screen.dart";
import "package:varindo_estate_management/screens/tabs_screen/community_tab_screen.dart";
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
    CommunityTabScreen(),
    BantuanTabScreen(),
    ProfileTabScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},

        backgroundColor: HexColor.fromHex(kSecondaryColor),
        shape: CircleBorder(),

        child: const Icon(LucideIcons.store500, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: HexColor.fromHex(kBackgroundColor),
      appBar: CustomLightOnlyAppbar(),
      bottomNavigationBar: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        bloc: locator.get<BottomNavigationBarCubit>(),
        builder: (_, state) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.12),
                  blurRadius: 24,
                  spreadRadius: 2,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              child: BottomAppBar(
                shape: CircularNotchedRectangle(),
                notchMargin: 8,
                color: Colors.white,
                surfaceTintColor: Colors.white,
                
                child: BlocBuilder(
                  bloc: locator.get<BottomNavigationBarCubit>(),
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Iconsax.home),
                                    SizedBox(height: 4,),
                                    MainTextComponent(text: "Home", fontSize: 12, fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
            
                              GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Iconsax.people),
                                    SizedBox(height: 4,),
                                    MainTextComponent(text: "Community", fontSize: 12, fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ),
            
                        SizedBox(width: 48,),
            
                        SizedBox(width: 48,),
                    
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(LucideIcons.handHeart),
                                    SizedBox(height: 4,),
                                    MainTextComponent(text: "Bantuan", fontSize: 12, fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                          
                              GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(LucideIcons.circleUserRound),
                                    SizedBox(height: 4,),
                                    MainTextComponent(text: "Akun", fontSize: 12, fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        }
      ),
      body: SafeArea(
        child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
          bloc: locator.get<BottomNavigationBarCubit>(),
          builder: (_, state) {
            return screenTabList[state.currentIndex];
          }
        ),
      ),
    );
  }
}

// NavigationBar(
//                 elevation: 20,
//                 selectedIndex: state.currentIndex,
//                 onDestinationSelected: (index) {
//                   locator.get<BottomNavigationBarCubit>().updateState(index);
//                 },
//                 backgroundColor: Colors.white,
//                 indicatorColor: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.5),
//                 destinations: [
//                   NavigationDestination(
//                     icon: Icon(Iconsax.home),
//                     selectedIcon: Icon(Iconsax.home5, color: HexColor.fromHex(kSecondaryColor),),
//                     label: "Home",
//                   ),
//                   NavigationDestination(
//                     icon: Icon(LucideIcons.usersRound),
//                     selectedIcon: Icon(LucideIcons.usersRound600, color: HexColor.fromHex(kSecondaryColor),),
//                     label: "Community",
//                   ),
//                   NavigationDestination(
//                     icon: Icon(LucideIcons.handHeart),
//                     selectedIcon: Icon(LucideIcons.handHeart600, color: HexColor.fromHex(kSecondaryColor),),
//                     label: "Bantuan",
//                   ),
//                   NavigationDestination(
//                     icon: Icon(LucideIcons.circleUserRound),
//                     selectedIcon: Icon(LucideIcons.circleUserRound600, color: HexColor.fromHex(kSecondaryColor),),
//                     label: "Profil",
//                   ),
//                 ],
//               ),