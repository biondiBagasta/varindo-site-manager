import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class ButtonComponent extends StatelessWidget {

  const ButtonComponent({ super.key, required this.onPressed, required this.label, required this.buttonColor,
  this.isWhite = true, this.height = 50  });

  final Function onPressed;
  final String label;
  final Color buttonColor;
  final bool isWhite;
  final double height;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constantScreenWidth,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor
        ),
        onPressed: () {
          onPressed();
        }, 
        child: MainTextComponent(
          text: label, 
          fontSize: 14, 
          fontWeight: FontWeight.w500,
          isWhite: isWhite ? true : false,
        ),
      ),
    );
  }
}