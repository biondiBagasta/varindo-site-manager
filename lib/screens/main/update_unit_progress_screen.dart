import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:percent_indicator/linear_percent_indicator.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/fields/textarea_only_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class UpdateUnitProgressScreen extends StatefulWidget {

  const UpdateUnitProgressScreen({ super.key, required this.progressName });

  final String progressName;

  @override
  State<UpdateUnitProgressScreen> createState() => _UpdateUnitProgressScreenState();
}

class _UpdateUnitProgressScreenState extends State<UpdateUnitProgressScreen> {

  final catatanController = TextEditingController();

  bool selectedSwitch = false;

  @override
  void dispose() {
    catatanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: widget.progressName),
      body: SafeArea(
        child: Material(
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
                  children: [
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MainTextComponent(
                                  text: "Dinding", 
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w600, 
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: MainTextComponent(text: "Tahap Aktif", fontSize: 12, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            SizedBox(height: 6,),
                            MainTextComponent(text: "Sektor B - Unit 4, Sisi Utara", fontSize: 14, fontWeight: FontWeight.w400),
                            SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainTextComponent(
                                  text: "Progress", 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w500
                                ),
                                MainTextComponent(
                                  text: "65% Selesai", 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w500
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            LinearPercentIndicator(
                              padding: EdgeInsets.zero,
                              lineHeight: 14.0,
                              percent: 65 / 100,
                              backgroundColor: Colors.black12,
                              progressColor: HexColor.fromHex(kPrimaryColor),
                              barRadius: Radius.circular(12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MainTextComponent(
                                  text: "Foto Kondisi Lapangan", 
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w600, 
                                ),
                                SizedBox(width: 8,),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(kSecondaryColor).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: MainTextComponent(text: "Wajib", fontSize: 12, fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                            SizedBox(height: 18,),
                            DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                color: Colors.grey,
                                strokeWidth: 1.5,
                                dashPattern: [8, 4],
                                radius: Radius.circular(12)  
                              ),
                              child: Container(
                                padding: EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: HexColor.fromHex(kBackgroundColor),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 36,
                                      backgroundColor: Colors.black12,
                                      child: Icon(LucideIcons.camera, size: 36,),
                                    ),
                                    SizedBox(height: 12,),
                                    MainTextComponent(text: "Klik untuk Memotret", fontSize: 16, fontWeight: FontWeight.w600),
                                    SizedBox(height: 6,),
                                    MainTextComponent(
                                      textAlign: TextAlign.center,
                                      text: "Pastikan sambungan semen dan pemandu peratan terlihat jelas di bingkai.", 
                                      fontSize: 14, 
                                      fontWeight: FontWeight.w400
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MainTextComponent(text: "Catatan Lapangan", fontSize: 16, fontWeight: FontWeight.w600),
                            SizedBox(height: 18,),
                            TextareaOnlyComponent(
                              hint: "Catatan keterlambatan material, pengamatan struktural atau cuaca.", 
                              controller: catatanController, 
                              validationMessage: ""
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MainTextComponent(
                                    text: "Tandai Sebagai Selesai", 
                                    fontSize: 16, 
                                    fontWeight: FontWeight.w600
                                  ),
                                  SizedBox(height: 8,),
                                  MainTextComponent(
                                    text: "Tanda tangani tahap Dinding untuk sektor ini", 
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 12,),
                            Switch(
                              value: selectedSwitch, 
                              onChanged: (value) {
                                setState(() {
                                  selectedSwitch = value;
                                });
                              }
                            )
                          ],
                        )
                      ),
                    ),
                    SizedBox(height: 24,),
                    ButtonComponent(
                      onPressed: () {}, 
                      label: "Simpan Progress", 
                      buttonColor: HexColor.fromHex(kPrimaryColor)
                    ),
                    SizedBox(height: 64,)
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