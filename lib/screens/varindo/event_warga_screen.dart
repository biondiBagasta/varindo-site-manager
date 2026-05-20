import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/buttons/outlined_button_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";
import "package:calendar_date_picker2/calendar_date_picker2.dart";

class EventWargaScreen extends StatefulWidget {

  const EventWargaScreen({ super.key });

  @override
  State<EventWargaScreen> createState() => _EventWargaScreenState();
}

class _EventWargaScreenState extends State<EventWargaScreen> {
  var listOfCurrentDateTime = <DateTime?>[DateTime.now(), DateTime.now()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor.fromHex(kPrimaryColor),
        child: Icon(LucideIcons.plus, color: Colors.white,),
        onPressed: () {

      }),
      appBar: CustomLAppbarBackLight(title: "Event Warga"),
      body: SafeArea(
        child: Material(
          elevation: 1,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          color: Colors.white,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextComponent(
                      text: "Tetap berinteraksi dengan warga lainnya dan berbagi informasi demi kenyamanan bersama.", 
                      fontSize: 14, 
                      fontWeight: FontWeight.w400
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          calendarType: CalendarDatePicker2Type.range,
                        ), 
                        value: listOfCurrentDateTime,
                        onValueChanged: (value) {
                        },
                      ),
                    ),
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MainTextComponent(text: "Agenda Mendatang", fontSize: 16, fontWeight: FontWeight.w600),
                        MainTextColorComponent(text: "See All", fontSize: 14, fontWeight: FontWeight.w500, color: HexColor.fromHex(kSecondaryColor))
                      ],
                    ),
                    SizedBox(height: 18,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Container(
                            width: constantScreenWidth,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/CAROUSEL-2.jpg")
                              )
                            ),
                          ),
                          SizedBox(height: 8,),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "Rapat Warga Bulanan", fontSize: 16, fontWeight: FontWeight.w600),
                                SizedBox(height: 8,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(LucideIcons.clock, size: 18,),
                                    SizedBox(width: 8,),
                                    MainTextComponent(text: "19:00 - 21:00", fontSize: 14, fontWeight: FontWeight.w400)
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(LucideIcons.mapPin, size: 18,),
                                    SizedBox(width: 8,),
                                    Expanded(child: MainTextComponent(text: "Lapangan Blok A", fontSize: 14, fontWeight: FontWeight.w400))
                                  ],
                                ),
                                SizedBox(height: 24,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      
                                      child: ButtonComponent(
                                        onPressed: () {}, 
                                        label: "Hadir", 
                                        buttonColor: HexColor.fromHex(kPrimaryColor),
                                        height: 40,
                                      ),
                                    ),
                                    SizedBox(width: 18,),
                                    Expanded(
                                      child: OutlinedButtonComponent(
                                        onPressed: () {

                                        }, 
                                        label: "Izin", 
                                        buttonColor: HexColor.fromHex(kSecondaryColor), 
                                        labelColor: HexColor.fromHex(kSecondaryColor),
                                        height: 40,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor.fromHex(kInfoColor).withValues(alpha: 0.2)
                              ),
                              child: Center(
                                child: Icon(Icons.construction, size: 48, color: HexColor.fromHex(kTextColor),),
                              ),
                            ),
                            SizedBox(width: 18,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: MainTextComponent(text: "Kerja Bakti Bersama", fontSize: 14, fontWeight: FontWeight.w500)),
                                      SizedBox(width: 18,),
                                      MainTextColorComponent(text: "Sun, 14 May 2026", fontSize: 14, fontWeight: FontWeight.w500, color: HexColor.fromHex(kSecondaryColor))
                                    ],
                                  ),
                                  SizedBox(height: 6,),
                                  MainTextComponent(
                                    text: "Pembersihan Saluran Air dan Selokan bersama agar lingkungan terbebas banjir, DBD dan sebagainya.", 
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w400,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 6,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          MainTextColorComponent(
                                            text: "Details", 
                                            fontSize: 14, 
                                            fontWeight: FontWeight.w500, 
                                            color: HexColor.fromHex(kPrimaryColor)
                                          ),
                                          SizedBox(width: 6,),
                                          Icon(LucideIcons.arrowRight, size: 18, color: HexColor.fromHex(kPrimaryColor),),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              )
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