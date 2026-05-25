import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PerumahanItemComponent extends StatefulWidget {

  const PerumahanItemComponent({
    super.key,
    required this.name,
    required this.location,
    required this.type,
    required this.totalUnit,
    required this.terjual,
    required this.onTap,
    required this.image
  });

  final String name;
  final String location;
  final String type;
  final int totalUnit;
  final int terjual;
  final Function onTap;
  final String image;

  @override
  State<PerumahanItemComponent> createState() => _PerumahanItemComponentState();
}

class _PerumahanItemComponentState extends State<PerumahanItemComponent> {

  Color getTypeColor(String type) {
    if(type == "PREMIUM") {
      return HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4);
    } else if(type == "RESIDENTICAL") {
      return HexColor.fromHex(kInfoColor).withValues(alpha: 0.4);
    } else {
      return Colors.black12;
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: HexColor.fromHex(kPrimaryColor),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Container(
              width: constantScreenWidth,
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.image),
                  fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTextComponent(text: widget.name, fontSize: 16, fontWeight: FontWeight.w600),
                          SizedBox(height: 8,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(LucideIcons.mapPin, color: HexColor.fromHex(kSecondaryColor), size: 18,),
                              SizedBox(width: 6,),
                              MainTextComponent(text: widget.location, fontSize: 14, fontWeight: FontWeight.w400)
                            ],
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: getTypeColor(widget.type)
                        ),
                        child: MainTextComponent(text: widget.type, fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 4,),
                  Divider(),
                  SizedBox(height: 4,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "Total Unit", fontSize: 12, fontWeight: FontWeight.w400),
                                SizedBox(height: 2,),
                                MainTextComponent(text: "${widget.totalUnit} Unit", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                            SizedBox(width: 4,),
                            SizedBox(height: 48, child: VerticalDivider(thickness: 1, )),
                            SizedBox(width: 4,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "Terjual", fontSize: 12, fontWeight: FontWeight.w400),
                                SizedBox(height: 2,),
                                MainTextComponent(text: "${widget.terjual} Unit", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black26
                        ),
                        child: Center(
                          child: Icon(LucideIcons.chevronRight),
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