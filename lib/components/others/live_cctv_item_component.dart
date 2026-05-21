import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class LiveCctvItemComponent extends StatelessWidget {

  const LiveCctvItemComponent({ super.key, required this.image, required this.locationName });

  final String image;
  final String locationName;


  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(12),
          width: constantScreenWidth,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "●",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: HexColor.fromHex(kSecondaryColor)
                        )
                      ),
                      TextSpan(
                        text: "Live",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        )
                      ),
                    ]
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black38
                    ),
                      child: MainTextComponent(
                      text: locationName, 
                      fontSize: 14, 
                      fontWeight: FontWeight.w500,
                      isWhite: true,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withValues(alpha: 0.8),
                    child: Icon(LucideIcons.maximize, color: Colors.white,),
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}