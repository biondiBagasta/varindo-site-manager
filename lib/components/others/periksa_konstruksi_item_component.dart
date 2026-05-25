import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/buttons/button_icon_component.dart";
import "package:varindo_estate_management/components/buttons/outlined_button_icon_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PeriksaKonstruksiItemComponent extends StatefulWidget {
  const PeriksaKonstruksiItemComponent({
    super.key,
    required this.title,
    required this.status,
    required this.isHightlighthed,
    required this.onTapDetail,
    required this.onTapUpdate
  });

  final String title;
  final String status;
  final bool isHightlighthed;
  final Function onTapDetail;
  final Function onTapUpdate;

  @override
  State<PeriksaKonstruksiItemComponent> createState() =>
      _PeriksaKonstruksiItemComponentState();
}

class _PeriksaKonstruksiItemComponentState
    extends State<PeriksaKonstruksiItemComponent> {

  bool isExpanded = false;

  @override
  void initState() {
    isExpanded = widget.isHightlighthed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.isHightlighthed ? Colors.white : Colors.black12,
        border: Border.all(
          color: widget.isHightlighthed
              ? HexColor.fromHex(kSuccessColor)
              : Colors.grey,
          width: widget.isHightlighthed ? 1.6 : 0.8,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [

          /// HEADER
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: widget.isHightlighthed
                          ? HexColor.fromHex(kSuccessColor)
                              .withValues(alpha: 0.4)
                          : Colors.black12,
                      child: Icon(widget.isHightlighthed ? LucideIcons.refreshCcw : LucideIcons.rotateCcw),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: MainTextComponent(
                        text: widget.title,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(width: 12),

              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: widget.isHightlighthed
                      ? HexColor.fromHex(kSuccessColor)
                          .withValues(alpha: 0.2)
                      : Colors.black12,
                ),
                child: MainTextComponent(
                  text: widget.status,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),

          SizedBox(height: 12),

          /// EXPANSION PANEL
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black12,
              ),
            ),
            child: ExpansionTile(
              tilePadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 2,
              ),
              childrenPadding: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              title: MainTextComponent(
                text: "Action",
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              initiallyExpanded: isExpanded,
              onExpansionChanged: (value) {
                setState(() {
                  isExpanded = value;
                });
              },
              children: [

                /// BUTTON 1
                OutlinedButtonIconComponent(
                  height: 40,
                  onPressed: () {
                    widget.onTapDetail();
                  }, 
                  label: "Lihat Detail", 
                  buttonColor: HexColor.fromHex(kInfoColor), 
                  icon: LucideIcons.eye, 
                  labelColor: HexColor.fromHex(kInfoColor)
                ),

                SizedBox(height: 12),

                /// BUTTON 2
                ButtonIconComponent(
                  onPressed: () {
                    widget.onTapUpdate();
                  }, 
                  label: "Update", 
                  buttonColor: HexColor.fromHex(kPrimaryColor), 
                  icon: LucideIcons.squarePen
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}