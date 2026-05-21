import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";

class MarketplaceLayananEstateTab extends StatelessWidget {

  const MarketplaceLayananEstateTab({ super.key });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainTextComponent(text: "Marketplace Layanan Estate", fontSize: 16, fontWeight: FontWeight.w600)
      ],
    );
  }
}