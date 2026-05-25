import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/others/progress_pengerjaan_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class DetailClusterScreen extends StatelessWidget {

  const DetailClusterScreen({ super.key, required this.clusterName, required this.blokName });

  final String clusterName;
  final String blokName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Detail Cluster"),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextColorComponent(
                      text: clusterName, 
                      fontSize: 22, 
                      fontWeight: FontWeight.w600,
                      color: HexColor.fromHex(kPrimaryColor),
                    ),
                    SizedBox(height: 4,),
                    MainTextComponent(
                      text: blokName, 
                      fontSize: 16, 
                      fontWeight: FontWeight.w400
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(
                      text: "Peta Masterplan", 
                      fontSize: 16, 
                      fontWeight: FontWeight.w600
                    ),
                    SizedBox(height: 18,),
                    Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: constantScreenWidth,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider("https://casaderamos.id/wp-content/uploads/2024/01/Perbedaan-Site-Plan-dan-Master-Plan-1.jpg")
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                
                              },
                              child: Icon(LucideIcons.zoomIn, color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(text: "Unit Rumah", fontSize: 16, fontWeight: FontWeight.w600),
                    SizedBox(height: 4,),
                    MainTextComponent(text: "Unit Aktif di Blok A", fontSize: 14, fontWeight: FontWeight.w400),
                    SizedBox(height: 18,),
                    TabBar(
                      onTap: (index) {
                
                      },
                      indicatorColor: HexColor.fromHex(kPrimaryColor),
                      labelStyle: GoogleFonts.openSans(
                        fontWeight: FontWeight.w600,
                        color: HexColor.fromHex(kPrimaryColor),
                        fontSize: 14
                      ),
                      unselectedLabelStyle: GoogleFonts.openSans(
                        fontWeight: FontWeight.w400,
                        color: HexColor.fromHex(kTextColor),
                        fontSize: 14
                      ),
                      tabs: [
                        Tab(
                          text: "Daftar",
                        ),
                        Tab(
                          text: "Peta",
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            padding: EdgeInsets.only(bottom: 64),
                            children: [
                              ProgressPengerjaanItemComponent(
                                image: "https://dinaspupr.bandaacehkota.go.id/wp-content/uploads/sites/59/2020/07/ciri-pondasi-rumah-yang-tidak-kuat-apa-saja-640x381.jpg",
                                blokName: "A-12", 
                                propertiType: "UNIT HUNIAN", 
                                typePengerjaan: "PONDASI", 
                                progressPercent: 25,
                                onTap: () {
                                  context.pushNamed("detail-cluster-unit", extra: {
                                    "unitName": "A-12"
                                  });
                                },
                              ),
                              SizedBox(height: 12,),
                              ProgressPengerjaanItemComponent(
                                image: "https://chinasteelbuildsales.com/wp-content/uploads/2025/09/Steel-Web-Truss-Building1.webp",
                                blokName: "A-14", 
                                propertiType: "UNIT HUNIAN", 
                                typePengerjaan: "RANGKA", 
                                progressPercent: 55,
                                onTap: () {
                                  context.pushNamed("detail-cluster-unit", extra: {
                                    "unitName": "A-14"
                                  });
                                },
                              ),
                              SizedBox(height: 12,),
                              ProgressPengerjaanItemComponent(
                                image: "https://www.gardaoto.com/wp-content/uploads/2022/04/jenis-Jenis-Atap-Rumah-Berdasarkan-Bahan-Materialnya.jpg",
                                blokName: "B-02", 
                                propertiType: "UNIT HUNIAN", 
                                typePengerjaan: "ATAP", 
                                progressPercent: 80,
                                onTap: () {
                                  context.pushNamed("detail-cluster-unit", extra: {
                                    "unitName": "B-02"
                                  });
                                },
                              ),
                              SizedBox(height: 12,),
                              ProgressPengerjaanItemComponent(
                                image: "https://inkontraktor.com/wp-content/uploads/2023/04/inspirasi-model-atap-rumah-1024x576.webp",
                                blokName: "E-05", 
                                propertiType: "UNIT HUNIAN", 
                                typePengerjaan: "TERSEDIA", 
                                progressPercent: 0,
                                onTap: () {
                                  context.pushNamed("detail-unit-approved", extra: {
                                    "unitName": "E-05"
                                  });
                                },
                              ),
                              SizedBox(height: 12,),
                            ],
                          ),
                          Center()
                        ]
                      ),
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