import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MainTextColorComponent extends StatelessWidget {

  const MainTextColorComponent({ super.key, required this.text, required this.fontSize, required this.fontWeight, this.textAlign = TextAlign.left,
  this.textOverflow = TextOverflow.ellipsis, this.maxLines = 2, required this.color });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: 
        color
      ),
    );
  }
}