import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:varindo_estate_management/utils/utils.dart";

class StrokedMainTextComponent extends StatelessWidget {

  const StrokedMainTextComponent({ super.key, required this.text, required this.fontSize, required this.fontWeight, this.textAlign = TextAlign.left,
  this.textOverflow = TextOverflow.ellipsis, this.maxLines = 2, this.isWhite = false });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text, 
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: textOverflow,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1..color = Colors.black
          ),
        ),
        Text(
          text, 
          textAlign: textAlign,
          maxLines: maxLines,
          overflow: textOverflow,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: 
            isWhite ? Colors.white :
            HexColor.fromHex(kTextColor),
          ),
        )
      ],
    );
  }
}