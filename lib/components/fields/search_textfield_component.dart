import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:varindo_estate_management/utils/utils.dart';

class SearchTextFieldComponent extends StatelessWidget {

  const SearchTextFieldComponent({ super.key,required this.hint, required this.controller,
  required this.validationMessage });

  final TextEditingController controller;
  final String hint;
  final String validationMessage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.openSans(
        fontSize: 14,
        fontWeight: FontWeight.w500
      ),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 48,
              decoration: BoxDecoration(
                color: HexColor.fromHex(kPrimaryColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8)
                )
              ),
            ),
            SizedBox(width: 6,),
            const Icon(LucideIcons.search),
          ],
        ),
        contentPadding: const EdgeInsets.all(8),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 0.5
          )
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 0.5
          )
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 0.5
          )
        ),
        hintText: hint,
        hintStyle: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w400
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorStyle: const TextStyle(
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: HexColor.fromHex(kPrimaryColor))
        ),
      ),
      validator: (value) {
        if(value!.isEmpty) {
          return validationMessage;
        } else {
          return null;
        }
      },
    );
  }
}