import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/others/komplain_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class KomplainTabScreen extends StatefulWidget {

  const KomplainTabScreen({ super.key });

  @override
  State<KomplainTabScreen> createState() => _KomplainTabScreenState();
}

class _KomplainTabScreenState extends State<KomplainTabScreen> {
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: HexColor.fromHex(kPrimaryColor),
        onPressed: () {
          context.pushNamed("komplain-create");
        },
        icon: Icon(LucideIcons.plus, color: Colors.white,),
        label: MainTextComponent(text: "Komplain", fontSize: 14, fontWeight: FontWeight.w500, isWhite: true,),
      ),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.only(left: 18, right: 18, top: 18),
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
                        child: Icon(Iconsax.note_remove5),
                      ),
                    ),
                    SizedBox(width: 12,),
                    MainTextComponent(text: "Daftar Komplain", fontSize: 22, fontWeight: FontWeight.w600)
                  ],
                ),
                SizedBox(height: 24,),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 64),
                    children: [
                      KomplainItemComponent(
                        siteName: "Grand Natura",
                        clusterName: "FUCHIDEA",
                        homeNumber: "A-12",
                        image: "https://api.djabesmen.co.id/storage/upload/article/tanda-tanda-atap-bocor.jpg", 
                        detailKomplain: "Atap Bocor ", 
                        onTap: () {
                          context.pushNamed("komplain-detail", extra: {
                            "siteName": "Grand Natura",
                            "clusterName": "FUCHIDEA",
                            "homeNumber": "A-12",
                            "image": "https://api.djabesmen.co.id/storage/upload/article/tanda-tanda-atap-bocor.jpg", 
                            "detailKomplain": "Atap Bocor ", 
                          });
                        }
                      ),
                      SizedBox(height: 12,),
                      KomplainItemComponent(
                        siteName: "Gardenia Raya",
                        clusterName: "ASTERDEA",
                        homeNumber: "A-14",
                        image: "https://cloud.jpnn.com/photo/arsip/watermark/2020/02/21/tembok-rumah-roboh-dan-menimpa-penghuni-foto-pojokpitu-91.png", 
                        detailKomplain: "Tembok Ambruk", 
                        onTap: () {
                          context.pushNamed("komplain-detail", extra: {
                            "siteName": "Gardenia Raya",
                            "clusterName": "ASTERDEA",
                            "homeNumber": "A-14",
                            "image": "https://cloud.jpnn.com/photo/arsip/watermark/2020/02/21/tembok-rumah-roboh-dan-menimpa-penghuni-foto-pojokpitu-91.png", 
                            "detailKomplain": "Tembok Ambruk", 
                          });
                        }
                      ),
                      SizedBox(height: 12,),
                      KomplainItemComponent(
                        siteName: "Grand Natura",
                        clusterName: "ORCHIDEA",
                        homeNumber: "B-12",
                        image: "https://infopublik.id/assets/upload/headline//WhatsApp_Image_2025-01-06_at_19_32_47.jpeg", 
                        detailKomplain: "Jalan Rusak ", 
                        onTap: () {
                          context.pushNamed("komplain-detail", extra: {
                            "siteName": "Grand Natura",
                            "clusterName": "ORCHIDEA",
                            "homeNumber": "B-12",
                            "image": "https://infopublik.id/assets/upload/headline//WhatsApp_Image_2025-01-06_at_19_32_47.jpeg", 
                            "detailKomplain": "Jalan Rusak ", 
                          });
                        }
                      ),
                      SizedBox(height: 12,),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}