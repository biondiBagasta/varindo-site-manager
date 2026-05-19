import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_dynamic_component.dart";

class MainMenuItemComponent extends StatelessWidget {

  const MainMenuItemComponent({ super.key, required this.label, required this.icon, required this.color,
  required this.onTap });

  final String label;
  final IconData icon;
  final Color color;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 24,
            child: Icon(icon, color: Colors.white, size: 26,),
          ),
          SizedBox(height: 6,),
          MainTextDynamicComponent(text: label, fontSize: 12, fontWeight: FontWeight.w600, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}