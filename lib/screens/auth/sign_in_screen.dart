import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_light_only_appbars.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/fields/regular_textfield_icon_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class SignInScreen extends StatefulWidget {

  const SignInScreen({ super.key });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightOnlyAppbar(),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2)
                        ),
                        child: Center(
                          child: Icon(Icons.construction, color: HexColor.fromHex(kPrimaryColor),),
                        ),
                      ),
                      SizedBox(width: 12,),
                      MainTextComponent(text: "Varindo Site Manager", fontSize: 22, fontWeight: FontWeight.w600)
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/varindo-logo.png', width: 96,),
                      SizedBox(height: 8,),
                      MainTextComponent(text: "PT. VARINDO LOMBOK INTI", fontSize: 22, fontWeight: FontWeight.w600),
                      SizedBox(height: 2,),
                      Text(
                        "Developer & Real Estate",
                        style: GoogleFonts.inter(
                          color: HexColor.fromHex(kTextColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      SizedBox(height: 18,),
                      RegularTextfieldIconComponent(
                        label: "Email", 
                        hint: "Masukkan Email", 
                        controller: emailController, 
                        validationMessage: "*Email harus diisi.", 
                        icon: LucideIcons.mail
                      ),
                      SizedBox(height: 18,),
                      RegularTextfieldIconComponent(
                        label: "Password", 
                        hint: "Masukkan Password", 
                        controller: passwordController, 
                        validationMessage: "*Password harus diisi.", 
                        icon: LucideIcons.lock,
                        isObscure: true,
                      ),
                      SizedBox(height: 24,),
                      ButtonComponent(
                        onPressed: () {
                          context.pushNamed("main");
                        }, 
                        label: "Login", 
                        buttonColor: HexColor.fromHex(kPrimaryColor)
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Divider(),
                      MainTextComponent(
                        text: "Sistem Internal Varindo dan Akses Terbatas", 
                        fontSize: 14, 
                        fontWeight: FontWeight.w500
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}