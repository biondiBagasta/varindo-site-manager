import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MainTextDynamicComponent extends StatelessWidget {

  const MainTextDynamicComponent({ super.key, required this.text, required this.fontSize, required this.fontWeight, this.textAlign = TextAlign.left,
  this.textOverflow = TextOverflow.ellipsis, this.maxLines = 1, this.isWhite = false });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text, 
      maxFontSize: fontSize,
      minFontSize: 4,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: GoogleFonts.inter(
        fontWeight: fontWeight,
        color: 
        isWhite ? Colors.white :
        HexColor.fromHex(kTextColor)
      ),
    );
  }
}