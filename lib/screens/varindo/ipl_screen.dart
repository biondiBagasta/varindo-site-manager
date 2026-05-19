import "package:flutter/material.dart";
import "package:flutter_svg_provider/flutter_svg_provider.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/outlined_button_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class IplScreen extends StatelessWidget {

  const IplScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "IPL"),
      body: SafeArea(
        child: Material(
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
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
                    Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      color: HexColor.fromHex(kPrimaryColor),
                      surfaceTintColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Svg("assets/curve_lines.svg")
                          )
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTextComponent(text: "Total Tagihan IPL", fontSize: 14, fontWeight: FontWeight.w500, isWhite: true,),
                            SizedBox(height: 12,),
                            MainTextComponent(text: FormatCurrency.convertToIdr(150000, 0), fontSize: 24, fontWeight: FontWeight.w600, isWhite: true,),
                            SizedBox(height: 28,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainTextComponent(text: "Periode Iuran", fontSize: 14, fontWeight: FontWeight.w400, isWhite: true,),
                                    SizedBox(height: 2,),
                                    MainTextComponent(text: "Mei 2026", fontSize: 16, fontWeight: FontWeight.w500, isWhite: true,),
                                  ],
                                ),
                                SizedBox(
                                  width: 120,
                                  child: OutlinedButtonComponent(
                                    onPressed: () {}, 
                                    label: "Pay Now", 
                                    buttonColor: HexColor.fromHex(kPrimaryColor), 
                                    labelColor: HexColor.fromHex(kPrimaryColor)
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTextComponent(text: "Informasi", fontSize: 16, fontWeight: FontWeight.w600),
                            SizedBox(height: 8,),
                            MainTextComponent(
                              text: "Untuk biaya perawatan fasilitas umum, pembayaran keamanan dan pembayaran petugas kebersihan.", 
                              fontSize: 14, 
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 12,),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.1)
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Icon(Iconsax.info_circle5, color: HexColor.fromHex(kPrimaryColor),),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  MainTextComponent(
                                    text: "Next Billing : 1 Juni 2026", 
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w500
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(text: "Payment History", fontSize: 16, fontWeight: FontWeight.w600),
                    SizedBox(height: 18,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Icon(LucideIcons.circleCheck600, color: HexColor.fromHex(kPrimaryColor),),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "IPL - Maret 2026", fontSize: 14, fontWeight: FontWeight.w600),
                                      SizedBox(height: 4,),
                                      MainTextComponent(text: "Lunas > 28 Maret 2026", fontSize: 12, fontWeight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MainTextComponent(text: FormatCurrency.convertToIdr(150000, 0), fontSize: 14, fontWeight: FontWeight.w600),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(LucideIcons.download, size: 16, color: HexColor.fromHex(kPrimaryColor),),
                                    SizedBox(width: 4,),
                                    MainTextColorComponent(text: "Receipt", fontSize: 12, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor),)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: HexColor.fromHex(kSecondaryColor),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.2),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Icon(LucideIcons.circleAlert600, color: HexColor.fromHex(kSecondaryColor),),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "IPL - Maret 2026", fontSize: 14, fontWeight: FontWeight.w600),
                                      SizedBox(height: 4,),
                                      MainTextComponent(text: "Pembayaran Gagal", fontSize: 12, fontWeight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            MainTextComponent(text: FormatCurrency.convertToIdr(150000, 0), fontSize: 14, fontWeight: FontWeight.w600),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Icon(LucideIcons.circleCheck600, color: HexColor.fromHex(kPrimaryColor),),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "IPL - Maret 2026", fontSize: 14, fontWeight: FontWeight.w600),
                                      SizedBox(height: 4,),
                                      MainTextComponent(text: "Lunas > 28 Maret 2026", fontSize: 12, fontWeight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MainTextComponent(text: FormatCurrency.convertToIdr(150000, 0), fontSize: 14, fontWeight: FontWeight.w600),
                                SizedBox(height: 4,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(LucideIcons.download, size: 16, color: HexColor.fromHex(kPrimaryColor),),
                                    SizedBox(width: 4,),
                                    MainTextColorComponent(text: "Receipt", fontSize: 12, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor),)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: HexColor.fromHex(kSecondaryColor),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.2),
                                      shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Icon(LucideIcons.circleAlert600, color: HexColor.fromHex(kSecondaryColor),),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "IPL - Maret 2026", fontSize: 14, fontWeight: FontWeight.w600),
                                      SizedBox(height: 4,),
                                      MainTextComponent(text: "Pembayaran Gagal", fontSize: 12, fontWeight: FontWeight.w400),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            MainTextComponent(text: FormatCurrency.convertToIdr(150000, 0), fontSize: 14, fontWeight: FontWeight.w600),
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