import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/others/varindo_layanan_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class LayananTabScreen extends StatefulWidget {

  const LayananTabScreen({ super.key });

  @override
  State<LayananTabScreen> createState() => _LayananTabScreenState();
}

class _LayananTabScreenState extends State<LayananTabScreen> {
    
  final List<Map<String, dynamic>> layananList = [
    {
      "title": "Jasa Kelistrikan",
      "color": HexColor.fromHex("#f7b731"),
      "icon": Iconsax.electricity5,
    },
    {
      "title": "Jasa Tukang",
      "color": Colors.black,
      "icon": Icons.construction,
    },
    {
      "title": "Jasa Home Cleaning", 
      "color": HexColor.fromHex(kPrimaryColor), 
      "icon": LucideIcons.brushCleaning600, 
    },
    {
      "title": "Jasa Plumbing", 
      "color": Colors.blue, 
      "icon": Icons.plumbing, 
    },
    {
      "title": "Jasa Agen ART",
      "color": Colors.purple,
      "icon": LucideIcons.userRoundPlus600,
    },
    {
      "title": "Jasa Pindah Rumah",
      "color": HexColor.fromHex("#3B3B98"),
      "icon": LucideIcons.truck600,
    },
    {
      "title": "Pemasangan Internet",
      "color": HexColor.fromHex("#4b6584"),
      "icon": LucideIcons.wifi600,
    },
    {
      "title": "Pemasangan CCTV",
      "color": HexColor.fromHex(kSecondaryColor),
      "icon": LucideIcons.cctv600,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4)
                ),
                child: Center(
                  child: Icon(Iconsax.element_25),
                ),
              ),
              SizedBox(width: 12,),
              MainTextComponent(text: "Layanan Jasa", fontSize: 24, fontWeight: FontWeight.w600)
            ],
          ),
          SizedBox(height: 24,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextComponent(text: "Pesan jasa profesional langsung ke rumah anda.", fontSize: 14, fontWeight: FontWeight.w400),
                  SizedBox(height: 18,),
                  // Card(
                  //   margin: EdgeInsets.zero,
                  //   clipBehavior: Clip.antiAlias,
                  //   child: Container(
                  //     padding: EdgeInsets.all(12),
                  //     width: constantScreenWidth,
                  //     height: 250,
                  //     decoration: BoxDecoration(
                  //       color: HexColor.fromHex(kPrimaryColor),
                  //       image: DecorationImage(
                  //         image: AssetImage("assets/varindo-meeting.jpeg"),
                  //         fit: BoxFit.cover,                                // overlay hijau + opacity
                  //         colorFilter: ColorFilter.mode(
                  //           HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.3),
                  //           BlendMode.srcATop,
                  //         ),
                  //       )
                  //     ),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         Container(
                  //           padding: EdgeInsets.all(6),
                  //           decoration: BoxDecoration(
                  //             color: HexColor.fromHex(kPrimaryColor),
                  //             borderRadius: BorderRadius.circular(12)
                  //           ),
                  //           child: MainTextComponent(text: "Promo Terbatas", fontSize: 12, fontWeight: FontWeight.w500, isWhite: true,),
                  //         ),
                  //         SizedBox(height: 6,),
                  //         StrokedMainTextComponent(text: "Diskon 20% Kebersihan", fontSize: 16, fontWeight: FontWeight.w600, isWhite: true,),
                  //         SizedBox(height: 6,),
                  //         StrokedMainTextComponent(text: "Untuk pesanan pertama home cleaning hari ini.", fontSize: 14, fontWeight: FontWeight.w500, isWhite: true,)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 24,),
              
                  GridView.builder(
                    itemCount: layananList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
              
                      // tinggi fix
                      mainAxisExtent: 180,
                    ),
                    itemBuilder: (context, index) {
              
                      return VarindoLayananItemComponent(
                        title: layananList[index]["title"], 
                        color: layananList[index]["color"], 
                        icon: layananList[index]["icon"], 
                        onTap: () {
                          context.pushNamed("form-pemesanan-jasa");
                        }
                      );
                    },
                  ),
                  SizedBox(height: 24,),
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                            radius: 32,
                            child: Icon(LucideIcons.shieldCheck600, color: HexColor.fromHex(kPrimaryColor), size: 32,),
                          ),
                          SizedBox(height: 12,),
                          MainTextColorComponent(text: "Jaminan Keamanan", fontSize: 16, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor)),
                          SizedBox(height: 8,),
                          MainTextComponent(
                            textAlign: TextAlign.center,
                            text: "Seluruh Teknisi dan penyedia jasa di Varindo Estate telah melalui proses verifikasi identitas dan latar belakang yang ketat untuk kenyamanan anda", 
                            fontSize: 14, 
                            fontWeight: FontWeight.w400
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 64,)
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}