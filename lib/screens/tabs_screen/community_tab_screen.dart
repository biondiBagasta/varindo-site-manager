import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";

class CommunityTabScreen extends StatelessWidget {

  const CommunityTabScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainTextComponent(text: "Community Screen", fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}