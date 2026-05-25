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
      body: Padding(
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
                    unitName: "A-12",
                    image: "https://heriskontraktor.id/wp-content/uploads/2025/10/5.-Susun-Bata-Secara-Berselang-seling-1024x585.jpg", 
                    title: "Tukang Molor", 
                    onTap: () {}
                  ),
                  SizedBox(height: 12,),
                  KomplainItemComponent(
                    unitName: "A-13",
                    image: "https://media.dekoruma.com/article/2018/11/21172713/shutterstock_1146262964.jpg?resize=1000%2C667&ssl=1", 
                    title: "Bahan Rapuh", 
                    onTap: () {}
                  ),
                  SizedBox(height: 12,),
                  KomplainItemComponent(
                    unitName: "A-14",
                    image: "https://properti1.com/blog/wp-content/uploads/2023/05/jenis-batu-bata-untuk-bangun-rumah.jpg", 
                    title: "Bata ga sinkron", 
                    onTap: () {}
                  ),
                  SizedBox(height: 12,),
                  KomplainItemComponent(
                    unitName: "A-15",
                    image: "https://api.dafamland.com/storage/upload-data/article/image/article_img_1697771947_image.png", 
                    title: "Kebanyakan Tukang", 
                    onTap: () {}
                  ),
                  SizedBox(height: 12,),
                  KomplainItemComponent(
                    unitName: "A-16",
                    image: "https://ambpi.com/wp-content/uploads/2022/01/AM-1.jpg", 
                    title: "Batako Lemah", 
                    onTap: () {}
                  ),
                  SizedBox(height: 12,),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}