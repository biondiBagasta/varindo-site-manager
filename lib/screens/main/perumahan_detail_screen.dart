import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/others/daftar_cluster_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PerumahanDetailScreen extends StatelessWidget {

  const PerumahanDetailScreen({ super.key, required this.perumahanName });
  
  final String perumahanName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Perumahan $perumahanName"),
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
                        height: 200,
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
                    MainTextComponent(
                      text: "Daftar Cluster", 
                      fontSize: 16, 
                      fontWeight: FontWeight.w600
                    ),
                    SizedBox(height: 18,),
                    DaftarClusterItemComponent(
                      clusterName: "CLUSTER FUCHIDEA", 
                      blokName: "BLOK A", 
                      progressPercent: 75, 
                      status: "AKTIF",
                      onTap: () {
                        context.pushNamed("detail-cluster", extra: {
                          "clusterName": "CLUSTER FUCHIDEA",
                          "blokName": "BLOK A"
                        });
                      },
                    ),
                    SizedBox(height: 12,),
                    DaftarClusterItemComponent(
                      clusterName: "CLUSTER ASTERDEA", 
                      blokName: "BLOK B", 
                      progressPercent: 40, 
                      status: "AKTIF",
                      onTap: () {
                        context.pushNamed("detail-cluster", extra: {
                          "clusterName": "CLUSTER FUCHIDEA",
                          "blokName": "BLOK A"
                        });
                      },
                    ),
                    SizedBox(height: 12,),
                    DaftarClusterItemComponent(
                      clusterName: "CLUSTER ORCHIDEA", 
                      blokName: "BLOK E", 
                      progressPercent: 10, 
                      status: "TERSEDIA",
                      onTap: () {
                        context.pushNamed("detail-cluster", extra: {
                          "clusterName": "CLUSTER ORCHIDEA",
                          "blokName": "BLOK E"
                        });
                      },
                    ),
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