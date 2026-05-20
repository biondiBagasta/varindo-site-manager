import "package:avatar_glow/avatar_glow.dart";
import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:timelines_plus/timelines_plus.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class DaruratScreen extends StatefulWidget {

  const DaruratScreen({ super.key });

  @override
  State<DaruratScreen> createState() => _DaruratScreenState();
}

class _DaruratScreenState extends State<DaruratScreen> {
  final List<Map<String, dynamic>> timelineData = [
    {
      "title": "Order Dibuat",
      "date": "20 Mei 2026",
      "isDone": true,
    },
    {
      "title": "Diproses",
      "date": "21 Mei 2026",
      "isDone": true,
    },
    {
      "title": "Dikirim",
      "date": "22 Mei 2026",
      "isDone": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Panic Button"),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
          elevation: 1,
          child: SizedBox(
            width: constantScreenWidth,
            height: constantScreenHeight,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainTextComponent(text: "Bantuan Darurat", fontSize: 24, fontWeight: FontWeight.w600),
                    SizedBox(height: 8,),
                    MainTextComponent(
                      textAlign: TextAlign.center,
                      text: "Tahan tombol di bawah selama 3 detik untuk mengirimkan sinyal darurat ke petugas keamanan.", 
                      fontSize: 14, 
                      fontWeight: FontWeight.w400
                    ),
                    SizedBox(height: 64,),
                    AvatarGlow(
                      glowColor: HexColor.fromHex(kSecondaryColor),
                      duration: const Duration(milliseconds: 2000),
                      repeat: true,
                      animate: true,
                      curve: Curves.fastOutSlowIn,
                      glowRadiusFactor: 0.5,
                      child: Material(
                        elevation: 8,
                        shape: const CircleBorder(),
                        color: Colors.transparent,
                        child: CircleAvatar(
                          radius: 64,
                          backgroundColor: HexColor.fromHex(kSecondaryColor),
                          child: Icon(
                            LucideIcons.siren600,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 64,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 42,
                                  backgroundColor: Colors.black12,
                                  child: Icon(LucideIcons.shieldUser, color: Colors.black, size: 48,),
                                ),
                                SizedBox(height: 6,),
                                MainTextComponent(text: "Polisi", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: HexColor.fromHex(kPrimaryColor),
                              width: 1,
                            ),
                          ),
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 42,
                                  backgroundColor: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                  child: Icon(LucideIcons.shieldCheck, color: HexColor.fromHex(kPrimaryColor), size: 48,),
                                ),
                                SizedBox(height: 6,),
                                MainTextComponent(text: "Security", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 42,
                                  backgroundColor: Colors.red.withValues(alpha: 0.2),
                                  child: Icon(Icons.medical_services, color: Colors.red, size: 48,),
                                ),
                                SizedBox(height: 6,),
                                MainTextComponent(text: "Medis", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(18),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainTextComponent(text: "Status Respons", fontSize: 16, fontWeight: FontWeight.w600),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.16),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: MainTextColorComponent(text: "Siaga", fontSize: 14, fontWeight: FontWeight.w500, color: HexColor.fromHex(kSecondaryColor),),
                                )
                              ],
                            ),
                            SizedBox(height: 12,),
                            SizedBox(
                              width: constantScreenWidth,
                              height: 160,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Timeline.tileBuilder(
                                      theme: TimelineThemeData(
                                        nodePosition: 0,
                                        indicatorTheme: const IndicatorThemeData(
                                          size: 16,
                                        ),
                                        connectorTheme: const ConnectorThemeData(
                                          thickness: 2,
                                        ),
                                      ),
                                      builder: TimelineTileBuilder.connected(
                                        itemCount: timelineData.length,
                                    
                                        connectorBuilder: (_, index, __) {
                                          return SolidLineConnector(
                                            color: Colors.grey.shade300,
                                          );
                                        },
                                    
                                        indicatorBuilder: (_, index) {
                                          return DotIndicator(
                                            color: timelineData[index]["isDone"]
                                                ? Colors.green
                                                : Colors.grey,
                                          );
                                        },
                                    
                                        contentsBuilder: (_, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              left: 16,
                                              bottom: 24,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                    
                                                Text(
                                                  timelineData[index]["title"],
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                    
                                                const SizedBox(height: 4),
                                    
                                                Text(
                                                  timelineData[index]["date"],
                                                  style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8,),
                                  Container(
                                    width: 72,
                                    height: 72,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://assets.ujet.cx/files/mobile%20banking%20customer%20support.png"
                                        )
                                      )
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 64,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}