import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/others/live_cctv_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class LiveCctvScreen extends StatelessWidget {

  const LiveCctvScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Live CCTV"),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainTextComponent(text: "CCTV Monitoring", fontSize: 16, fontWeight: FontWeight.w600),
                              SizedBox(height: 2,),
                              MainTextComponent(
                                text: "Grand Natuna - Bung Hatta", 
                                fontSize: 14, 
                                fontWeight: FontWeight.w500
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: MainTextColorComponent(text: "● LIVE", fontSize: 12, fontWeight: FontWeight.w500, color: HexColor.fromHex(kSecondaryColor),)
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
                    LiveCctvItemComponent(
                      image: "assets/CAROUSEL-1.jpg", 
                      locationName: "CAM 01 - Gate Utama"
                    ),
                    SizedBox(height: 12,),
                    LiveCctvItemComponent(
                      image: "assets/CAROUSEL-2.jpg", 
                      locationName: "CAM 02 - Taman Sentral"
                    ),
                    SizedBox(height: 12,),
                    LiveCctvItemComponent(
                      image: "assets/CAROUSEL-3.jpg", 
                      locationName: "CAM 03 - Blok A"
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundColor: HexColor.fromHex(kInfoColor).withValues(alpha: 0.2),
                                    child: Icon(LucideIcons.shieldQuestionMark600, color: HexColor.fromHex(kInfoColor), size: 28,),
                                  ),
                                  SizedBox(width: 12,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MainTextComponent(text: "Butuh Bantuan?", fontSize: 16, fontWeight: FontWeight.w600),
                                        SizedBox(height: 2,),
                                        MainTextComponent(text: "Hubungi Pos Keamanan", fontSize: 14, fontWeight: FontWeight.w400)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            CircleAvatar(
                              radius: 28,
                              backgroundColor: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                              child: Icon(LucideIcons.phone600, color: HexColor.fromHex(kPrimaryColor), size: 28,),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 64,)
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