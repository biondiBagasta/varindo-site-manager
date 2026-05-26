import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/others/account_menu_section_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class ProfileTabScreen extends StatelessWidget {

  const ProfileTabScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4)
                ),
                child: Center(
                  child: Icon(Icons.account_circle),
                ),
              ),
              SizedBox(width: 12,),
              MainTextComponent(text: "Akun", fontSize: 24, fontWeight: FontWeight.w600)
            ],
          ),
          SizedBox(height: 24,),
          Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: HexColor.fromHex(kPrimaryColor),
                            width: 0.8
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/user-real.jpg")
                          )
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTextComponent(text: "Biondi Bagasta Wiko Putra", fontSize: 14, fontWeight: FontWeight.w600, maxLines: 1,
                            isWhite: false,),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Icon(LucideIcons.userStar, size: 18),
                                SizedBox(width: 6,),
                                Expanded(
                                  child: MainTextComponent(
                                    text: "Site Manager", 
                                    fontSize: 12, 
                                    fontWeight: FontWeight.w400,
                                    maxLines: 1,
                                    isWhite: false
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTextComponent(text: "Menu Lainnya", fontSize: 16, fontWeight: FontWeight.w600),
                          SizedBox(height: 18,),
                          AccountMenuSectionComponent(
                            icon: LucideIcons.building2, 
                            label: "Daftar Properti", 
                            iconColor: Colors.blueGrey,
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuSectionComponent(
                            icon: LucideIcons.server, 
                            label: "Ganti Sever", 
                            iconColor: HexColor.fromHex(kInfoColor),
                            onTap: () {},
                          ),                        
                          Divider(),
                          AccountMenuSectionComponent(
                            icon: LucideIcons.fingerprintPattern, 
                            label: "Keamanan Tambahan", 
                            iconColor: Colors.grey,
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuSectionComponent(
                            icon: LucideIcons.shieldCheck, 
                            label: "Privacy and Policy", 
                            iconColor: Colors.lightBlue,
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuSectionComponent(
                            icon: Icons.android, 
                            label: "Build Version 1.0.0", 
                            iconColor: Colors.lightGreen,
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuSectionComponent(
                            icon: LucideIcons.userRoundX, 
                            label: "Hapus Akun", 
                            iconColor: Colors.red,
                            onTap: () {},
                          ),
                          Divider(),
                          AccountMenuSectionComponent(
                            icon: LucideIcons.logOut, 
                            label: "Keluar Applikasi", 
                            iconColor: HexColor.fromHex(kSecondaryColor),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 64,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}