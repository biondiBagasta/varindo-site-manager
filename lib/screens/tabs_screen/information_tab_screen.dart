import "package:buttons_tabbar/buttons_tabbar.dart";
import "package:flutter/material.dart";
import "package:flutter_svg_provider/flutter_svg_provider.dart";
import "package:google_fonts/google_fonts.dart";
import "package:iconsax/iconsax.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:percent_indicator/flutter_percent_indicator.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/buttons/outlined_button_icon_component.dart";
import "package:varindo_estate_management/components/fields/search_textfield_component.dart";
import "package:varindo_estate_management/components/fields/textarea_only_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class InformationTabScreen extends StatefulWidget {

  const InformationTabScreen({ super.key });

  @override
  State<InformationTabScreen> createState() => _InformationTabScreenState();
}

class _InformationTabScreenState extends State<InformationTabScreen> with SingleTickerProviderStateMixin {

  final searchController = TextEditingController();
  final suggestionController = TextEditingController();

  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      surfaceTintColor: HexColor.fromHex(kPrimaryColor),
      elevation: 1,
      child: SizedBox(
        width: constantScreenWidth,
        height: constantScreenHeight,
        child: Padding(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4)
                      ),
                      child: Center(
                        child: Icon(Iconsax.info_circle5),
                      ),
                    ),
                    SizedBox(width: 12,),
                    MainTextComponent(text: "Informasi", fontSize: 28, fontWeight: FontWeight.w600)
                  ],
                ),
                SizedBox(height: 36,),
                MainTextComponent(text: "Berbagi wadah informasi warga", fontSize: 14, fontWeight: FontWeight.w500),
                SizedBox(height: 12,),
                SearchTextFieldComponent(
                  hint: "Cari diskusi atau pengumuman", 
                  controller: searchController, 
                  validationMessage: ""
                ),
                SizedBox(height: 24,),
                ButtonsTabBar(
                  controller: tabController,
                  splashColor: HexColor.fromHex(kPrimaryColor),
                  radius: 18,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12
                  ),
                  height: 46,
                  labelSpacing: 4,
                  backgroundColor: HexColor.fromHex(kPrimaryColor),
                  unselectedBackgroundColor: HexColor.fromHex(kBackgroundColor),
                  borderColor: HexColor.fromHex(kPrimaryColor),
                  borderWidth: 1,
                  elevation: 0.8,
                  unselectedBorderColor: HexColor.fromHex(kPrimaryColor),
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                  unselectedLabelStyle: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: HexColor.fromHex(kTextColor)
                  ),
                  tabs: [
                    Tab(
                      text: 'Umum',
                    ),
                    Tab(
                      text: 'Lost Found',
                    ),
                    Tab(
                      text: 'Security',
                    ),
                    Tab(
                      text: 'Saran',
                    ),
                  ]
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 48,
                              height: 48,
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
                              child: TextareaOnlyComponent(
                                hint: "Apa yang ingin anda bagikan hari ini?", 
                                controller: suggestionController, 
                                validationMessage: ""
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12,),
                        ButtonComponent(
                          onPressed: () {

                          }, 
                          label: "Posting", 
                          buttonColor: HexColor.fromHex(kPrimaryColor)
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Card(
                  clipBehavior: Clip.antiAlias,
                  color: HexColor.fromHex(kPrimaryColor),
                  surfaceTintColor: Colors.white,
                  margin: EdgeInsets.zero,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Svg("assets/curve_lines.svg")
                      )
                    ),
                    padding: EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTextComponent(text: "Top Suggestion", fontSize: 16, fontWeight: FontWeight.w600, isWhite: true,),
                        SizedBox(height: 8,),
                        MainTextComponent(text: "Renovasi Taman Bermain Cluster C", fontSize: 14, fontWeight: FontWeight.w400, isWhite: true,),
                        SizedBox(height: 18,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(LucideIcons.thumbsUp500, color: Colors.white,),
                                  SizedBox(width: 8,),
                                  Expanded(child: MainTextComponent(text: "124 Votes", fontSize: 14, fontWeight: FontWeight.w500, isWhite: true,))
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white
                              ),
                              onPressed: () {

                              }, 
                              child: MainTextComponent(text: "Vote Now", fontSize: 14, fontWeight: FontWeight.w500)
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Card(
                  margin: EdgeInsets.zero,
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: 6,
                          decoration: BoxDecoration(
                            color: HexColor.fromHex(kPrimaryColor),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18)
                            )
                          ),
                        ),
                        SizedBox(width: 18,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4),
                                        shape: BoxShape.circle
                                      ),
                                      child: Center(
                                        child: Icon(LucideIcons.megaphone, color: HexColor.fromHex(kTextColor),),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              MainTextComponent(text: "Estate Management", fontSize: 16, fontWeight: FontWeight.w600),
                                              SizedBox(width: 2,),
                                              Icon(Iconsax.verify5, color: HexColor.fromHex(kPrimaryColor),)
                                            ],
                                          ),
                                          SizedBox(height: 6,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              MainTextComponent(text: "PENGUMUMAN", fontSize: 12, fontWeight: FontWeight.w500),
                                              SizedBox(width: 4,),
                                              CircleAvatar(radius: 2, backgroundColor: HexColor.fromHex(kTextColor),),
                                              SizedBox(width: 4,),
                                              Expanded(child: MainTextComponent(text: "2 Jam yang lalu", fontSize: 12, fontWeight: FontWeight.w400))
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 12,),
                                MainTextComponent(
                                  textAlign: TextAlign.justify,
                                  text: "Akan dilakukan pemeliharaan rutin jaringan pipa air di sektor B pada hari Sabtu 3 Mei 2026. Mohon warga menampung cadangan air mulai pukul 09.00 WITA.", 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w400
                                ),
                                SizedBox(height: 12,),
                                Divider(),
                                SizedBox(height: 6,),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(LucideIcons.messageSquareText),
                                        SizedBox(width: 6,),
                                        MainTextComponent(text: "Komentar", fontSize: 14, fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                    SizedBox(width: 8,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(LucideIcons.share2),
                                        SizedBox(width: 6,),
                                        MainTextComponent(text: "Bagikan", fontSize: 14, fontWeight: FontWeight.w500)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 18,)
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Card(
                  margin: EdgeInsets.zero,
                  surfaceTintColor: HexColor.fromHex(kSecondaryColor),
                  color: Colors.white,
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          width: 6,
                          decoration: BoxDecoration(
                            color: HexColor.fromHex(kSecondaryColor),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18)
                            )
                          ),
                        ),
                        SizedBox(width: 18,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: MainTextComponent(text: "LOST & FOUND", fontSize: 14, fontWeight: FontWeight.w600)
                                    ),
                                    MainTextComponent(text: "1 hari yang lalu", fontSize: 12, fontWeight: FontWeight.w400)
                                  ],
                                ),
                                SizedBox(height: 12,),
                                MainTextComponent(
                                  textAlign: TextAlign.justify,
                                  text: "Ditemukan kunci mobil Toyota di area parkir Taman Bermain sekitar jam 19:00 tadi malam. Bagi yang merasa kehilangan bisa hubungi saya atau lapor ke security.", 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w400
                                ),
                                SizedBox(height: 12,),
                                Divider(),
                                SizedBox(height: 6,),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButtonIconComponent(
                                        onPressed: () {}, 
                                        label: "Hubungi Penemu", 
                                        buttonColor: HexColor.fromHex(kPrimaryColor), 
                                        icon: LucideIcons.phone, 
                                        labelColor: HexColor.fromHex(kPrimaryColor)
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 0.8,
                                          color: HexColor.fromHex(kPrimaryColor)
                                        ),
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: Icon(LucideIcons.share2),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 18,)
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Card(
                  surfaceTintColor: Colors.white,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/user-real.jpg"
                                  )
                                )
                              ),
                              
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainTextComponent(text: "Maya Putri", fontSize: 16, fontWeight: FontWeight.w600),
                                  SizedBox(height: 6,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      MainTextComponent(text: "SARAN", fontSize: 12, fontWeight: FontWeight.w500),
                                      SizedBox(width: 4,),
                                      CircleAvatar(radius: 2, backgroundColor: HexColor.fromHex(kTextColor),),
                                      SizedBox(width: 4,),
                                      Expanded(child: MainTextComponent(text: "2 hari yang lalu", fontSize: 12, fontWeight: FontWeight.w400))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 12,),
                        MainTextComponent(text: "Pengadaan Tempat Sampah Organik / Anorganik", fontSize: 16, fontWeight: FontWeight.w600),
                        SizedBox(height: 6,),
                        MainTextComponent(
                          textAlign: TextAlign.justify,
                          text: "Usul agar di setiap jalan estate disediakan tempat sampah terpisah untuk memudahkan pemilihan sampah dari sumbernya.", 
                          fontSize: 14, 
                          fontWeight: FontWeight.w400
                        ),
                        SizedBox(height: 12,),
                        Divider(),
                        SizedBox(height: 6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MainTextComponent(text: "Persetujuan Warga", fontSize: 14, fontWeight: FontWeight.w500)
                            ),
                            MainTextComponent(text: "82%", fontSize: 14, fontWeight: FontWeight.w500)
                          ],
                        ),
                        SizedBox(height: 12,),
                        LinearPercentIndicator(
                          lineHeight: 14.0,
                          percent: 0.82,
                          backgroundColor: Colors.black12,
                          progressColor: HexColor.fromHex(kPrimaryColor),
                          barRadius: Radius.circular(12),
                        ),
                        SizedBox(height: 24,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor.fromHex(kPrimaryColor)
                              ),
                              onPressed: () {},
                              icon: Icon(LucideIcons.thumbsUp, color: Colors.white,), 
                              label: MainTextComponent(text: "Setuju", fontSize: 14, fontWeight: FontWeight.w600, isWhite: true,)
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: HexColor.fromHex(kSecondaryColor)
                              ),
                              onPressed: () {},
                              icon: Icon(LucideIcons.thumbsDown, color: Colors.white,), 
                              label: MainTextComponent(text: "Setuju", fontSize: 14, fontWeight: FontWeight.w600, isWhite: true,)
                            ),
                          ],
                        ),
                        SizedBox(height: 18,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 64,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}