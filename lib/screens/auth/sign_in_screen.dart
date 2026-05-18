import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_light_only_appbars.dart";
import "package:varindo_estate_management/components/buttons/button_icon_component.dart";
import "package:varindo_estate_management/components/buttons/outlined_button_icon_component.dart";
import "package:varindo_estate_management/components/carousel/sign_in_carousel.dart";
import "package:varindo_estate_management/components/others/sign_in_interior_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class SignInScreen extends StatelessWidget {

  const SignInScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLightOnlyAppbar(),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 0.8,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/varindo-logo.png", width: 48, height: 48,),
                      MainTextColorComponent(text: "Varindo Estate", fontSize: 18, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor)),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Icon(LucideIcons.circleQuestionMark),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MainTextComponent(
                        text: "Sahabat Varindo", 
                        fontSize: 18, 
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6,),
                      MainTextComponent(
                        text: "Kelola Properti Anda, terhubung dengan tetangga, dan temukan layanan komunitas dengan mudah.", 
                        fontSize: 14, 
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 18,),
                      SignInCarousel(),
                      SizedBox(height: 18,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MainTextComponent(text: "Interior Terpilih", fontSize: 16, fontWeight: FontWeight.w600, textAlign: TextAlign.start,),
                        ],
                      ),
                      SizedBox(height: 12,),
                      SizedBox(
                        height: 200,
                        child: SigninInteriorComponent(),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      ButtonIconComponent(
                        onPressed: () {
                          context.pushNamed("phone-number-validation");
                        }, 
                        label: "Login", 
                        buttonColor: HexColor.fromHex(kPrimaryColor), 
                        icon: LucideIcons.logIn
                      ),
                      SizedBox(height: 12,),
                      OutlinedButtonIconComponent(
                        onPressed: () {}, 
                        label: "Register", 
                        buttonColor: HexColor.fromHex(kPrimaryColor), 
                        icon: LucideIcons.userRoundPlus, 
                        labelColor: HexColor.fromHex(kPrimaryColor)
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}