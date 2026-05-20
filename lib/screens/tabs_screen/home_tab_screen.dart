import "package:flutter/material.dart";
import "package:flutter_svg_provider/flutter_svg_provider.dart";
import "package:go_router/go_router.dart";
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
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 56,
                    height: 56,
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
                        image: AssetImage("assets/varindo-logo.png",),
                        
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTextColorComponent(
                          text: "ESTATE", 
                          fontSize: 14, 
                          fontWeight: FontWeight.w600,
                          color: HexColor.fromHex(kPrimaryColor),
                        ),
                        MainTextColorComponent(
                          text: "MANAGEMENT", 
                          fontSize: 14, 
                          fontWeight: FontWeight.w600,
                          color: HexColor.fromHex(kPrimaryColor),
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
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
                        image: Svg("assets/contour_line2.svg"),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 56,
                                height: 56,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: HexColor.fromHex(kPrimaryColor),
                                    width: 0.8
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage("assets/user-real.jpg")
                                  )
                                ),
                              ),
                              SizedBox(width: 12,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MainTextComponent(text: "Biondi Bagasta Wiko Putra", fontSize: 14, fontWeight: FontWeight.w600, maxLines: 1,
                                    isWhite: true,),
                                    SizedBox(height: 4,),
                                    Row(
                                      children: [
                                        Icon(LucideIcons.mapPin, size: 18, color: Colors.white,),
                                        SizedBox(width: 6,),
                                        Expanded(
                                          child: MainTextComponent(
                                            text: "Blok Asterdea Blok A.12, Grand Natura", 
                                            fontSize: 12, 
                                            fontWeight: FontWeight.w400,
                                            maxLines: 1,
                                            isWhite: true,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              )
                            ],
                          ),
                          SizedBox(height: 12,),
                          Row(
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
                        ],
                      ),
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
                            context.pushNamed("live-cctv");
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Darurat", 
                          icon: LucideIcons.siren400, 
                          color: Colors.red, 
                          onTap: () {
                            context.pushNamed("darurat");
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
                          label: "Layanan", 
                          icon: LucideIcons.headset400, 
                          color: Colors.blueGrey, 
                          onTap: () {
                    
                          }
                        ),
                    
                        MainMenuItemComponent(
                          label: "Hobbies", 
                          icon: LucideIcons.gamepad2Weight400, 
                          color: Colors.blue, 
                          onTap: () {
                    
                          }
                        ),
                        MainMenuItemComponent(
                          label: "IPL", 
                          icon: LucideIcons.fileText400, 
                          color: HexColor.fromHex("#01a3a4"), 
                          onTap: () {
                            context.pushNamed("ipl");
                          }
                        ),
                        MainMenuItemComponent(
                          label: "Event Warga", 
                          icon: LucideIcons.calendarCheck400, 
                          color: Colors.lightBlue, 
                          onTap: () {
                            context.pushNamed("event-warga");
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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
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
                  ),
                  Card(
                    color: Colors.white,
                    surfaceTintColor: HexColor.fromHex(kPrimaryColor),
                    elevation: 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
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
                                          color: HexColor.fromHex(kPrimaryColor),
                                          
                                        ),
                                        child: Icon(LucideIcons.userRound500, size: 36, color: Colors.white,),
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
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MainTextComponent(
                      text: "Promo Dan Aktivitas", 
                      fontSize: 16, 
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PromoCarousel()
                      ],
                    ),
                  ),
                            
                  SizedBox(height: 18,),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: BeritaComponent(),
                        )
                      ]
                    )
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
          expandedHeight: 250,
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

