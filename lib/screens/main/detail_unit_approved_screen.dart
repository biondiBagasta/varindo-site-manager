import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/carousel/gallery_unit_carousel.dart";
import "package:varindo_estate_management/components/others/periksa_konstruksi_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class DetailUnitApprovedScreen extends StatelessWidget {

  const DetailUnitApprovedScreen({ super.key, required this.unitName });

  final String unitName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Detail Progress Unit"),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextColorComponent(
                      text: unitName, 
                      fontSize: 22, 
                      fontWeight: FontWeight.w600,
                      color: HexColor.fromHex(kPrimaryColor),
                    ),
                    SizedBox(height: 4,),
                    MainTextComponent(
                      text: "Tahap 1 : Pasang Uitzet dan Bouwplank", 
                      fontSize: 16, 
                      fontWeight: FontWeight.w400
                    ),
                    SizedBox(height: 18,),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 14.0,
                      percent: 40 / 100,
                      backgroundColor: Colors.black12,
                      progressColor: HexColor.fromHex(kPrimaryColor),
                      barRadius: Radius.circular(12),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainTextComponent(text: "LUAS TANAH", fontSize: 14, fontWeight: FontWeight.w400),
                                  SizedBox(height: 6,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MainTextComponent(text: "120", fontSize: 22, fontWeight: FontWeight.w600),
                                      SizedBox(width: 4,),
                                      MainTextComponent(text: "sqm", fontSize: 16, fontWeight: FontWeight.w500,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Expanded(
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainTextComponent(text: "TIPE", fontSize: 14, fontWeight: FontWeight.w400),
                                  SizedBox(height: 6,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      MainTextComponent(text: "36", fontSize: 22, fontWeight: FontWeight.w600),
                                      SizedBox(width: 4,),
                                      MainTextComponent(text: "sqm", fontSize: 16, fontWeight: FontWeight.w500,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTextComponent(text: "Detail", fontSize: 16, fontWeight: FontWeight.w600),
                            SizedBox(height: 18,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainTextComponent(text: "Start", fontSize: 14, fontWeight: FontWeight.w400),
                                MainTextColorComponent(text: "24 Januari 2026", fontSize: 14, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor))
                              ],
                            ),
                            SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainTextComponent(text: "Estimasi", fontSize: 14, fontWeight: FontWeight.w400),
                                MainTextColorComponent(text: "120 Hari", fontSize: 14, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor))
                              ],
                            ),
                            SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MainTextComponent(text: "RAB Status", fontSize: 14, fontWeight: FontWeight.w400),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2)
                                  ),
                                  child: MainTextComponent(text: "APPROVED", fontSize: 12, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            SizedBox(height: 12,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    GalleryUnitCarousel(),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(LucideIcons.listTodo),
                                SizedBox(width: 8,),
                                MainTextComponent(
                                  text: "Daftar Periksa Konstruksi", 
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w600
                                )
                              ],
                            ),
                            SizedBox(height: 18,),
                            ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: [
                                PeriksaKonstruksiItemComponent(
                                  title: "1. Pasang Uitzet dan Bouwplank", 
                                  status: "DALAM PROSES", 
                                  isHightlighthed: true,
                                  onTapDetail: () {

                                  },
                                  onTapUpdate: () {
                                    context.pushNamed("update-unit-progress", extra: {
                                      "progressName": "Pasang Uitzet dan Bouwplank"
                                    });
                                  },
                                ),
                                SizedBox(height: 12,),
                                PeriksaKonstruksiItemComponent(
                                  title: "2. Galian Tanah Pondasi Batu Kali", 
                                  status: "Menunggu", 
                                  isHightlighthed: false,
                                  onTapDetail: () {

                                  },
                                  onTapUpdate: () {

                                  },
                                ),
                                SizedBox(height: 12,),
                                PeriksaKonstruksiItemComponent(
                                  title: "3. Pasangan Pondasi Batu Kali", 
                                  status: "MENUNGGU", 
                                  isHightlighthed: false,
                                  onTapDetail: () {

                                  },
                                  onTapUpdate: () {

                                  },
                                ),
                                SizedBox(height: 12,),
                                PeriksaKonstruksiItemComponent(
                                  title: "4. Pekerjaan Beton Sloof", 
                                  status: "Menunggu", 
                                  isHightlighthed: false,
                                  onTapDetail: () {

                                  },
                                  onTapUpdate: () {

                                  },
                                ),
                                SizedBox(height: 12,),
                                PeriksaKonstruksiItemComponent(
                                  title: "5. Pekerjaan Kolom Struktur", 
                                  status: "DALAM PROSES", 
                                  isHightlighthed: false,
                                  onTapDetail: () {

                                  },
                                  onTapUpdate: () {

                                  },
                                ),
                                SizedBox(height: 12,),
                              ],
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