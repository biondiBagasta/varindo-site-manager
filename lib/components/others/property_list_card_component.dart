import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PropertyItemCardComponent extends StatelessWidget {

  const PropertyItemCardComponent({ super.key, required this.image, required this.name,
  required this.locationName, required this.locationAddress, required this.onTap });

  final String image;
  final String name;
  final String locationName;
  final String locationAddress;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: constantScreenWidth,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover
                )
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: HexColor.fromHex(kPrimaryColor)
                    ),
                    child: MainTextComponent(text: name, fontSize: 12, fontWeight: FontWeight.w500, isWhite: true,),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTextComponent(text: locationName, fontSize: 16, fontWeight: FontWeight.w600),
                        SizedBox(height: 8,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(LucideIcons.mapPin),
                            SizedBox(width: 4,),
                            MainTextComponent(text: locationAddress, fontSize: 12, fontWeight: FontWeight.w400)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: HexColor.fromHex("#F0F2F5"),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(LucideIcons.chevronRight, color: HexColor.fromHex(kTextColor), size: 24,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}