import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_icon_component.dart";
import "package:varindo_estate_management/components/fields/phone_textfield_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PhoneNumberValidationScreen extends StatefulWidget {

  const PhoneNumberValidationScreen({ super.key });

  @override
  State<PhoneNumberValidationScreen> createState() => _PhoneNumberValidationScreenState();
}

class _PhoneNumberValidationScreenState extends State<PhoneNumberValidationScreen> {

  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Validasi Nomor Telepon"),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                      child: Icon(LucideIcons.shieldUser500, color: HexColor.fromHex(kPrimaryColor), size: 42,),
                    ),
                    SizedBox(height: 12,),
                    MainTextComponent(
                      text: "Nomor telepon anda sudah terdaftar.\nSilahkan verifikasi nomor di bawah ini untuk melanjutkan", 
                      fontSize: 14, 
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 18,),
                    PhoneTextFieldComponent(
                      label: "Nomor HP Terdaftar", 
                      hint: "Tanpa Prefix +62", 
                      controller: phoneController, 
                      validationMessage: "*Nomor HP Harus Diisi."
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: constantScreenWidth,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(LucideIcons.info,),
                          SizedBox(width: 12,),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    style: GoogleFonts.inter(
                                      color: HexColor.fromHex(kTextColor),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                    ),
                                    text: "Jika anda tidak mengenali nomor ini atau ingin melakukan pembaruan data, silahkan hubungi pihak"
                                  ),
                                  TextSpan(
                                    style: GoogleFonts.inter(
                                      color: HexColor.fromHex(kTextColor),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600
                                    ),
                                    text: " Estate Management Varindo"
                                  ),
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 18,),
                    ButtonIconComponent(
                      onPressed: () {
                        context.pushNamed("select-property-list");
                      }, 
                      label: "Lanjutkan", 
                      buttonColor: HexColor.fromHex(kPrimaryColor), 
                      icon: LucideIcons.arrowRight
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}