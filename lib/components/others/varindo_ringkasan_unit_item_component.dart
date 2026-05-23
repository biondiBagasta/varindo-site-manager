import "package:flutter/material.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class VarindoRingkasanUnitItemComponent extends StatelessWidget {

  const VarindoRingkasanUnitItemComponent({
    super.key,
    required this.status,
    required this.unit,
    required this.progressPercentage
  });

  final String status;
  final int unit;
  final int progressPercentage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainTextComponent(text: status, fontSize: 14, fontWeight: FontWeight.w400),
            SizedBox(
              height: 12,
            ),
            MainTextComponent(text: "$unit Units", fontSize: 16, fontWeight: FontWeight.w600),
            SizedBox(height: 12,),
            LinearPercentIndicator(
              padding: EdgeInsets.zero,
              lineHeight: 14.0,
              percent: progressPercentage / 100,
              backgroundColor: Colors.black12,
              progressColor: HexColor.fromHex(kPrimaryColor),
              barRadius: Radius.circular(12),
            ),
          ],
        ),
      ),
    );
  }
}