import "package:flutter/material.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class DaftarClusterItemComponent extends StatelessWidget {

  const DaftarClusterItemComponent({ super.key,
  required this.clusterName, required this.blokName, required this.progressPercent,
  required this.status });

  final String clusterName;
  final String blokName;
  final String status;
  final int progressPercent;

  static Color getTypeColor(String status) {
    if(status == "AKTIF") {
      return HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4);
    } else {
      return Colors.black12;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
      child: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainTextComponent(text: clusterName, fontSize: 14, fontWeight: FontWeight.w400),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: getTypeColor(status)
                  ),
                  child: MainTextComponent(text: status, fontSize: 12, fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(height: 8,),
            MainTextComponent(text: blokName, fontSize: 16, fontWeight: FontWeight.w600),
            SizedBox(height: 18,),
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
    );
  }
}