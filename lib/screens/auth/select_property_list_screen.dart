import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_light_only_appbars.dart";
import "package:varindo_estate_management/components/buttons/button_icon_component.dart";
import "package:varindo_estate_management/components/others/property_list_card_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class SelectPropertyListScreen extends StatelessWidget {

  const SelectPropertyListScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightOnlyAppbar(),
      body: SafeArea(
        child: Material(
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          color: Colors.white,
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/varindo-logo.png", width: 48, height: 48,),
                        MainTextColorComponent(text: "Varindo Estate", fontSize: 18, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor)),
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Icon(LucideIcons.circleQuestionMark),
                        ),
                      ],
                    ),
                    SizedBox(height: 18,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      elevation: 0.8,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: HexColor.fromHex(kPrimaryColor),
                                    radius: 28,
                                    child: CircleAvatar(
                                      radius: 26,
                                      backgroundImage: AssetImage("assets/user-real.jpg"),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "Asta Mahardika", fontSize: 16, fontWeight: FontWeight.w600),
                                      SizedBox(height: 4,),
                                      Container(
                                        padding: EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Icon(LucideIcons.shieldCheck, size: 18,),
                                            SizedBox(width: 4,),
                                            MainTextComponent(text: "Pemilik", fontSize: 12, fontWeight: FontWeight.w500)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            
                            SizedBox(width: 12,),
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: HexColor.fromHex(kPrimaryColor),
                                  width: 1
                                ),
                              ),
                              child: Center(
                                child: Icon(LucideIcons.pencil, color: HexColor.fromHex(kTextColor),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MainTextComponent(text: "Daftar Property Anda", fontSize: 16, fontWeight: FontWeight.w600),
                        MainTextComponent(text: "3 Unit", fontSize: 14, fontWeight: FontWeight.w400),
                      ],
                    ),
                    SizedBox(height: 18,),
                    PropertyItemCardComponent(
                      image: "assets/CAROUSEL-1.jpg", 
                      name: "Grand Nusantara", 
                      locationName: "Blok A.12", 
                      locationAddress: "Jl. Bung Hatta", 
                      onTap: () {
                        context.goNamed("main");
                      }
                    ),
                    SizedBox(height: 12,),
                    PropertyItemCardComponent(
                      image: "assets/CAROUSEL-2.jpg", 
                      name: "Gardenia Raya", 
                      locationName: "Blok B.05", 
                      locationAddress: "Jl. Gora Lingsar", 
                      onTap: () {
                        context.goNamed("main");
                      }
                    ),
                    SizedBox(height: 12,),
                    PropertyItemCardComponent(
                      image: "assets/CAROUSEL-3.jpg", 
                      name: "Taman Mandalika", 
                      locationName: "Blok C.22", 
                      locationAddress: "Lingkar Gerung", 
                      onTap: () {
                        context.goNamed("main");
                      }
                    ),
                    SizedBox(height: 24,),
                    ButtonIconComponent(
                      onPressed: () {}, 
                      label: "Tambah Properti", 
                      buttonColor: HexColor.fromHex(kPrimaryColor), 
                      icon: LucideIcons.plus
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}