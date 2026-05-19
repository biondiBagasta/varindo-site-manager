import "package:flutter/material.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class OutlinedButtonComponent extends StatelessWidget {

  const OutlinedButtonComponent({ super.key, required this.onPressed, required this.label, required this.buttonColor,
  required this.labelColor, this.height = 50  });

  final Function onPressed;
  final String label;
  final Color buttonColor;
  final Color labelColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constantScreenWidth,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 1,
          side: BorderSide(
            color: buttonColor,
            width: 1
          )
        ),
        onPressed: () {
          onPressed();
        }, 
        child: MainTextColorComponent(
          text: label, 
          fontSize: 14, 
          fontWeight: FontWeight.w600,
          color: labelColor,
        ),
      ),
    );
  }
}