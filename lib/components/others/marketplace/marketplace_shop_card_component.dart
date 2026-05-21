import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MarketplaceShopCardComponent extends StatelessWidget {

  const MarketplaceShopCardComponent({ super.key, required this.shopName, required this.image,
  required this.onTap, required this.rating, required this.ratingCount });
  
  final String shopName;
  final String image;
  final Function onTap;
  final double rating;
  final int ratingCount;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: HexColor.fromHex(kPrimaryColor),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(image,),
                ),
              ),
              SizedBox(height: 8,),
              MainTextComponent(
                text: shopName, 
                fontSize: 14, 
                fontWeight: FontWeight.w500
              ),
              SizedBox(height: 8,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: HexColor.fromHex(kPrimaryColor), size: 18,),
                  SizedBox(width: 6,),
                  Expanded(
                    child: MainTextComponent(
                      text: "$rating ($ratingCount)", 
                      fontSize: 12, 
                      fontWeight: FontWeight.w400
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}