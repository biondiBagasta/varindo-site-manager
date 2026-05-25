import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";

class KomplainItemComponent extends StatelessWidget {

  const KomplainItemComponent({ super.key, required this.image,
  required this.title, required this.onTap, required this.unitName });

  final String image;
  final String title;
  final String unitName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(image)
                        )
                      ),
                    ),
                    SizedBox(width: 12,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTextComponent(text: title, fontSize: 14, fontWeight: FontWeight.w600),
                          SizedBox(height: 6,),
                          MainTextComponent(text: "Unit : $unitName", fontSize: 12, fontWeight: FontWeight.w500)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 12,),
              MainTextComponent(
                text: "31 Februari 2026", 
                fontSize: 12, 
                fontWeight: FontWeight.w400
              )
            ],
          ),
        ),
      ),
    );
  }
}