import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";

class VarindoLayananItemComponent extends StatelessWidget {

  const VarindoLayananItemComponent({ super.key, required this.title, required this.color, required this.icon,
  required this.onTap });

  final String title;
  final Color color;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.16),
                radius: 36,
                child: Icon(icon, color: color, size: 36,),
              ),
              SizedBox(height: 12,),
              MainTextComponent(
                textAlign: TextAlign.center,
                text: title, 
                fontSize: 16, 
                fontWeight: FontWeight.w600
              )
            ],
          ),
        ),
      ),
    );
  }
}