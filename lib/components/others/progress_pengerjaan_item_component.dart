import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class ProgressPengerjaanItemComponent extends StatelessWidget {

  const ProgressPengerjaanItemComponent({ super.key, required this.blokName, required this.propertiType,
  required this.typePengerjaan, required this.progressPercent, required this.image, required this.onTap });
  
  final String blokName;
  final String propertiType;
  final String typePengerjaan;
  final int progressPercent;
  final String image;
  final Function onTap;

  static Color getColorByType(String type) {
    if(type == "PONDASI") {
      return HexColor.fromHex("#d35400");
    } else if(type == "RANGKA") {
      return HexColor.fromHex("#2c3e50");
    } else if(type == "ATAP") {
      return HexColor.fromHex(kSecondaryColor);
    } else {
      return HexColor.fromHex(kInfoColor);
    }
  }

  static IconData getIconByType(String type) {
    if(type == "PONDASI") {
      return LucideIcons.brickWall;
    } else if(type == "RANGKA") {
      return LucideIcons.building2;
    } else if(type == "ATAP") {
      return LucideIcons.house;
    } else {
      return LucideIcons.calendarCheck;
    }
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainTextComponent(text: blokName, fontSize: 16, fontWeight: FontWeight.w600),
                      SizedBox(height: 4,),
                      MainTextComponent(text: propertiType, fontSize: 14, fontWeight: FontWeight.w400)
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              SizedBox(height: 12,),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: getColorByType(typePengerjaan).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(getIconByType(typePengerjaan), size: 18, color: getColorByType(typePengerjaan),),
                    SizedBox(width: 4,),
                    MainTextColorComponent(text: typePengerjaan, fontSize: 12, fontWeight: FontWeight.w500, color: getColorByType(typePengerjaan))
                  ],
                ),
              ),
              SizedBox(height: 4,),
              Divider(),
              SizedBox(height: 4,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTextComponent(
                    text: "Progress", 
                    fontSize: 14, 
                    fontWeight: FontWeight.w500
                  ),
                  MainTextComponent(
                    text: "$progressPercent%", 
                    fontSize: 14, 
                    fontWeight: FontWeight.w500
                  ),
                ],
              ),
              SizedBox(height: 8,),
              LinearPercentIndicator(
                padding: EdgeInsets.zero,
                lineHeight: 14.0,
                percent: progressPercent / 100,
                backgroundColor: Colors.black12,
                progressColor: HexColor.fromHex(kPrimaryColor),
                barRadius: Radius.circular(12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}