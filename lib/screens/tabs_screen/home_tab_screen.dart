import "package:flutter/material.dart";
import "package:flutter_svg_provider/flutter_svg_provider.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/carousel/promo_carousel.dart";
import "package:varindo_estate_management/components/others/berita_component.dart";
import "package:varindo_estate_management/components/others/main_menu_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/components/texts/main_text_dynamic_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class HomeTabScreen extends StatefulWidget {

  const HomeTabScreen({ super.key });

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {

  Widget buildStickyheader() {
    return Material(
      color: Colors.white,
      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
      elevation: 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12),
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
                      shape: BoxShape.circle,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.black26,
                      //     blurRadius: 10,
                      //     spreadRadius: 2,
                      //     offset: Offset(0, 4),
                      //   ),
                      // ],
                      image: DecorationImage(
                        image: AssetImage("assets/varindo-logo.jpg"),

                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const SizedBox(width: 18,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTextComponent(
                          text: "Biondi Bagasta Wiko Putra", 
                          fontSize: 16, 
                          fontWeight: FontWeight.w600
                        ),
                        SizedBox(height: 2,),
                        Row(
                          children: [
                            Expanded(
                              child: MainTextComponent(
                                text: "Jln. Industri, GG. Gurita No. 5, Gatep Permai, Taman Sari", 
                                fontSize: 12, 
                                fontWeight: FontWeight.w500,
                                maxLines: 2,
                                textOverflow: TextOverflow.ellipsis,
                              )
                            )
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
            const SizedBox(width: 12,),
            CircleAvatar(
              backgroundColor: HexColor.fromHex(kPrimaryColor),
              radius: 20,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Iconsax.notification5, color: Colors.white, size: 22,),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: MainTextComponent(text: "5", fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Builder(
      builder: (context) {
        final top = MediaQuery.of(context).padding.top;
        return Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: top + 68,),
                Material(
                  color: HexColor.fromHex(kPrimaryColor),
                  surfaceTintColor: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  elevation: 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Svg("assets/counter_line.svg"),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.white,
                                  surfaceTintColor: HexColor.fromHex(kSecondaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(LucideIcons.key600, color: HexColor.fromHex(kSecondaryColor), size: 32,),
                                        SizedBox(width: 8,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MainTextDynamicComponent(
                                              text: "ID Konsumen", 
                                              fontSize: 12, 
                                              fontWeight: FontWeight.w400,
                                              isWhite: false,
                                            ),
                                            const SizedBox(height: 2,),
                                            MainTextDynamicComponent(
                                              text: "F1D0140018", 
                                              fontSize: 14, 
                                              fontWeight: FontWeight.w600,
                                              isWhite: false,
                                            ),
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
                                  surfaceTintColor: HexColor.fromHex(kSecondaryColor),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Iconsax.card_edit5, color: HexColor.fromHex(kSecondaryColor), size: 32,),
                                        SizedBox(width: 8,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MainTextDynamicComponent(
                                              text: "Tagihan (IPL)", 
                                              fontSize: 12, 
                                              fontWeight: FontWeight.w400,
                                              isWhite: false,
                                            ),
                                            const SizedBox(height: 2,),
                                            MainTextDynamicComponent(
                                              text: FormatCurrency.convertToIdr(150000, 0), 
                                              fontSize: 14, 
                                              fontWeight: FontWeight.w600,
                                              maxLines: 1,
                                              isWhite: false,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:  0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Drag Indicator
            const SizedBox(height: 8),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: constantScreenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.8, // adjust sesuai desain
                      children: [
                        MainMenuItemComponent(
                          label: "Live CCTV", 
                          icon: LucideIcons.cctv400, 
                          color: Colors.orange, 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Panic Button", 
                          icon: LucideIcons.siren400, 
                          color: Colors.red, 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Marketplace", 
                          icon: LucideIcons.store400, 
                          color: Colors.green, 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Service Place", 
                          icon: LucideIcons.settings400, 
                          color: Colors.blueGrey, 
                          onTap: () {
                    
                          }
                        ),
                    
                        MainMenuItemComponent(
                          label: "Hobbies", 
                          icon: LucideIcons.gamepad2, 
                          color: Colors.blue, 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "IPL", 
                          icon: Iconsax.card_edit, 
                          color: HexColor.fromHex("#01a3a4"), 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Event Warga", 
                          icon: LucideIcons.calendarFold400, 
                          color: Colors.lightBlue, 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Lainnya", 
                          icon: LucideIcons.layoutGrid400, 
                          color: Colors.black, 
                          onTap: () {
                    
                          }
                        ),
                      ],
                    ),
                  ),
                            
                  Card(
                    color: Colors.white,
                    surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                    elevation: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MainTextComponent(
                                text: "Security on Duty", 
                                fontSize: 16, 
                                fontWeight: FontWeight.w600,
                                isWhite: false,
                              ),
                              MainTextColorComponent(
                                text: "Lihat Semua", 
                                fontSize: 14, 
                                fontWeight: FontWeight.w600, 
                                color: HexColor.fromHex(kSecondaryColor)
                              )
                            ],
                          ),
                          Divider(),
                          SizedBox(
                            width: constantScreenWidth,
                            
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 52,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.1),
                                          
                                        ),
                                        child: Icon(LucideIcons.userRound500, size: 36,),
                                      ),
                                      SizedBox(width: 12,),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            MainTextComponent(
                                              text: "Biban Azimuh", 
                                              fontSize: 14, 
                                              fontWeight: FontWeight.w500,
                                              isWhite: false,
                                            ),
                                            SizedBox(height: 2,),
                                            MainTextComponent(
                                              text: "ID : 52710102xxxx", 
                                              fontSize: 12, 
                                              fontWeight: FontWeight.w500,
                                              isWhite: false,
                                            ),
                                            const SizedBox(height: 2,),
                                            Row(
                                              children: [
                                                Icon(LucideIcons.clock, size: 18,),
                                                SizedBox(width: 6,),
                                                MainTextComponent(
                                                  text: "28 Apr 2025, 08:00 - 19:59", 
                                                  fontSize: 12, 
                                                  fontWeight: FontWeight.w400,
                                                  isWhite: false,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(LucideIcons.cloudSun500, size: 18, color: Colors.yellow,),
                                          SizedBox(width: 2,),
                                          MainTextComponent(
                                            text: "Shift Pagi", 
                                            fontSize: 10, 
                                            fontWeight: FontWeight.w600,
                                            isWhite: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                  ],
                                )
                                          
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                            
                  SizedBox(height: 18,),
                            
                  Card(
                    color: Colors.white,
                    surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                    elevation: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTextComponent(
                            text: "Promo Dan Aktivitas", 
                            fontSize: 16, 
                            fontWeight: FontWeight.w600
                          ),
                          SizedBox(height: 12,),
                          PromoCarousel()
                        ],
                      ),
                    ),
                  ),
                            
                  SizedBox(height: 18,),
                            
                  Card(
                    surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                    elevation: 0.8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MainTextComponent(
                                text: "Berita", 
                                fontSize: 16, 
                                fontWeight: FontWeight.w600
                              ),
                              MainTextColorComponent(
                                text: "Lihat Semua", 
                                fontSize: 14, 
                                fontWeight: FontWeight.w600, 
                                color: HexColor.fromHex(kSecondaryColor)
                              )
                            ],
                          ),
                          
                          const SizedBox(height: 18,),
                          
                          SizedBox(
                            height: 200,
                            child: BeritaComponent(),
                          )
                        ]
                      )
                    ),
                  ),
                            
                  SizedBox(height: 36,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          expandedHeight: 184,
          titleSpacing: 0,
          toolbarHeight: 68,
          title: buildStickyheader(),
          flexibleSpace: FlexibleSpaceBar(
            background: buildHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: buildContent(),
        )
      ],
    );
  }
}

