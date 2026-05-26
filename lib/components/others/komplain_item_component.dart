import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class KomplainItemComponent extends StatelessWidget {

  const KomplainItemComponent({ super.key, required this.image,
  required this.siteName, required this.clusterName, required this.homeNumber, required this.detailKomplain,
  required this.onTap });

  final String image;
  final String siteName;
  final String clusterName;
  final String homeNumber;
  final String detailKomplain;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextComponent(text: siteName, fontSize: 16, fontWeight: FontWeight.w500),
                    SizedBox(height: 6,),
                    MainTextComponent(text: "Cluster : $clusterName", fontSize: 12, fontWeight: FontWeight.w500),
                    SizedBox(height: 6,),
                    Container(
                      width: constantScreenWidth,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black12,
                      ),
                      child: MainTextComponent(text: detailKomplain, fontSize: 12, fontWeight: FontWeight.w400, maxLines: 2, textOverflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
              ),
              SizedBox(width: 18,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      MainTextComponent(text: homeNumber, fontSize: 32, fontWeight: FontWeight.w600),
                      SizedBox(width: 18,),
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(image)
                          )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  MainTextComponent(text: "31 Mei 2026", fontSize: 12, fontWeight: FontWeight.w500)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}