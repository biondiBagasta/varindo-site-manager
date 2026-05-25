import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class ButtonIconComponent extends StatelessWidget {

  const ButtonIconComponent({ super.key, required this.onPressed, required this.label, required this.buttonColor,
  required this.icon, this.isWhite = true, this.height = 50  });

  final Function onPressed;
  final String label;
  final Color buttonColor;
  final IconData icon;
  final bool isWhite;
  final double height;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constantScreenWidth,
      height: height,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
        onPressed: () {
          onPressed();
        }, 
        label: MainTextComponent(
          text: label, 
          fontSize: 14, 
          fontWeight: FontWeight.w500,
          isWhite: isWhite ? true : false,
        ),
        icon: Icon(icon, color: isWhite ? Colors.white : HexColor.fromHex(kTextColor),),
      ),
    );
  }
}