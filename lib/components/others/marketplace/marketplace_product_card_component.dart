import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/components/texts/main_text_dynamic_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MarketplaceProductCardComponent extends StatelessWidget {

  const MarketplaceProductCardComponent({ super.key,
  required this.name, required this.image, required this.shopName, required this.price, required this.onTap });

  final String name;
  final String image;
  final String shopName;
  final int price;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(image)
                )
              ),
            ),
            SizedBox(height: 6,),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTextComponent(text: name, fontSize: 14, fontWeight: FontWeight.w500, maxLines: 2,),
                  SizedBox(height: 4,),
                  MainTextComponent(text: shopName, fontSize: 12, fontWeight: FontWeight.w400),
                  SizedBox(height: 8,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MainTextDynamicComponent(
                          text: FormatCurrency.convertToIdr(price, 0), 
                          fontSize: 14, 
                          fontWeight: FontWeight.w600,
                          maxLines: 1,
                        )
                      ),
                      SizedBox(width: 6,),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: HexColor.fromHex(kPrimaryColor),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Icon(Icons.add_shopping_cart, color: Colors.white,),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}