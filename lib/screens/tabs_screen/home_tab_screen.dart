import "package:flutter/material.dart";
import "package:flutter_svg_provider/flutter_svg_provider.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/others/cluster_item_component.dart";
import "package:varindo_estate_management/components/others/varindo_ringkasan_unit_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
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
                          text: "SITE", 
                          fontSize: 14, 
                          fontWeight: FontWeight.w600,
                          color: HexColor.fromHex(kPrimaryColor),
                        ),
                        MainTextColorComponent(
                          text: "MANAGER", 
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
                                    MainTextComponent(text: "Biondi Bagasta Wiko Putra", fontSize: 16, fontWeight: FontWeight.w600, maxLines: 1,
                                    isWhite: true,),
                                    SizedBox(height: 4,),
                                    Row(
                                      children: [
                                        Icon(LucideIcons.userStar, size: 24, color: Colors.white,),
                                        SizedBox(width: 6,),
                                        Expanded(
                                          child: MainTextComponent(
                                            text: "Site Manager", 
                                            fontSize: 14, 
                                            fontWeight: FontWeight.w500,
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
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withValues(alpha:  0.08),
        //     blurRadius: 16,
        //     offset: const Offset(0, -4),
        //   ),
        // ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            SizedBox(height: 12,),
            MainTextComponent(
              text: "Ringkasan Unit", 
              fontSize: 16, 
              fontWeight: FontWeight.w600
            ),
            SizedBox(height: 18,),
            VarindoRingkasanUnitItemComponent(
              status: "ON-PROCESS ADMINISTRASI", 
              unit: 24, 
              progressPercentage: 20
            ),
            SizedBox(height: 12,),
            VarindoRingkasanUnitItemComponent(
              status: "ON-PROCESS PEMBANGUNAN", 
              unit: 58, 
              progressPercentage: 60
            ),
            SizedBox(height: 12,),
            VarindoRingkasanUnitItemComponent(
              status: "SELESAI", 
              unit: 142, 
              progressPercentage: 100
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MainTextComponent(
                  text: "Daftar Cluster", 
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
            SizedBox(height: 18,),
            ClusterItemComponent(
              name: "Grand Natura", 
              location: "Jl. Raya Mataram", 
              type: "PREMIUM", 
              totalUnit: 120, 
              terjual: 95, 
              onTap: () {

              }, 
              image: "https://picture.rumah123.com/r123-images/1080x720-fit/customer/1954025/46837d7dd9b82823bba6acd7588bf6a3.jpg?noWatermark"
            ),
            SizedBox(height: 12,),
            ClusterItemComponent(
              name: "Gardenia Raya", 
              location: "Jl. Gardenia Raya", 
              type: "RESIDENTICAL", 
              totalUnit: 120, 
              terjual: 95, 
              onTap: () {

              }, 
              image: "https://varindohome.com/wp-content/uploads/GERBANG-GARDENIA.jpg"
            ),
            SizedBox(height: 12,),
            ClusterItemComponent(
              name: "Taman Mandali", 
              location: "Jl. Raya Mataram", 
              type: "SUBURBAN", 
              totalUnit: 120, 
              terjual: 95, 
              onTap: () {

              }, 
              image: "https://picture.rumah123.com/r123-images/1080x720-fit/customer/1954025/ba9e59161a3af20e9723d2fbd835357e.jpg?noWatermark"
            ),
            SizedBox(height: 12,),
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
          expandedHeight: 180,
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

