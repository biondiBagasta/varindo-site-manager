import "package:calendar_date_picker2/calendar_date_picker2.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/buttons/outlined_button_icon_component.dart";
import "package:varindo_estate_management/components/carousel/gallery_unit_carousel.dart";
import "package:varindo_estate_management/components/fields/number_textfield_component.dart";
import "package:varindo_estate_management/components/fields/readonly_textfield_icon_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PengajuanSpmkScreen extends StatefulWidget {

  const PengajuanSpmkScreen({ super.key, required this.unitName });

  final String unitName;

  @override
  State<PengajuanSpmkScreen> createState() => _PengajuanSpmkScreenState();
}

class _PengajuanSpmkScreenState extends State<PengajuanSpmkScreen> {
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final estimasiController = TextEditingController();

  final List<DateTime> dateList = [DateTime.now()];

  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    estimasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Pengajuan SPMK"),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainTextColorComponent(
                      text: widget.unitName, 
                      fontSize: 22, 
                      fontWeight: FontWeight.w600,
                      color: HexColor.fromHex(kPrimaryColor),
                    ),
                    SizedBox(height: 4,),
                    MainTextComponent(
                      text: "TAHAP - PERSIAPAN KONSTRUKSI", 
                      fontSize: 16, 
                      fontWeight: FontWeight.w400
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 100,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 18
                      ),
                      children: [
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "LUAS TANAH", fontSize: 14, fontWeight: FontWeight.w400),
                                SizedBox(height: 6,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MainTextComponent(text: "120", fontSize: 22, fontWeight: FontWeight.w600),
                                    SizedBox(width: 4,),
                                    MainTextComponent(text: "sqm", fontSize: 16, fontWeight: FontWeight.w500,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "TIPE", fontSize: 14, fontWeight: FontWeight.w400),
                                SizedBox(height: 6,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MainTextComponent(text: "36", fontSize: 22, fontWeight: FontWeight.w600),
                                    SizedBox(width: 4,),
                                    MainTextComponent(text: "sqm", fontSize: 16, fontWeight: FontWeight.w500,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "STATUS SITE", fontSize: 14, fontWeight: FontWeight.w400),
                                SizedBox(height: 6,),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4)
                                  ),
                                  child: MainTextComponent(text: "Available", fontSize: 12, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 1,)
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "PROGRESS", fontSize: 14, fontWeight: FontWeight.w400),
                                SizedBox(height: 6,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MainTextComponent(text: "12", fontSize: 22, fontWeight: FontWeight.w600),
                                    SizedBox(width: 4,),
                                    MainTextComponent(text: "%", fontSize: 16, fontWeight: FontWeight.w500,)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    GalleryUnitCarousel(),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReadonlyTextfieldIconComponent(
                              label: "Start Date", 
                              hint: "Start Date", 
                              controller: startDateController, 
                              icon: LucideIcons.calendar1, 
                              onTapTextfield: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true, 
                                  builder: (context) {
                                    return Dialog(  
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CalendarDatePicker2(
                                              config: CalendarDatePicker2Config(
                                                calendarType: CalendarDatePicker2Type.single,
                                                // selectableDayPredicate: (day) {
                                                //   final now = DateTime.now();
                                        
                                                //   // Batas minimum: 1 tahun lalu dari hari ini
                                                //   final oneYearAgo = DateTime(now.year - 1, now.month, now.day);
                                        
                                                //   // Disable jika lebih lama dari 1 tahun lalu
                                                //   return day.isAfter(oneYearAgo.subtract(Duration(days: 1)));
                                                // },
                                              ), 
                                              value: dateList,
                                              onValueChanged: (value) {
                                                selectedStartDate = value[0];

                                                startDateController.text = formatDateToIndonesian(value[0]);
                                              },
                                            ),
                                            SizedBox(height: 12,),
                                            ButtonComponent(
                                              onPressed: () {
                                                context.pop();
                                              }, 
                                              label: "Pilih", 
                                              buttonColor: HexColor.fromHex(kPrimaryColor)
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                );
                              }
                            ),
                            SizedBox(height: 18,),
                            ReadonlyTextfieldIconComponent(
                              label: "End Date", 
                              hint: "End Date", 
                              controller: endDateController, 
                              icon: LucideIcons.calendarCheck, 
                              onTapTextfield: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true, 
                                  builder: (context) {
                                    return Dialog(  
                                      backgroundColor: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CalendarDatePicker2(
                                              config: CalendarDatePicker2Config(
                                                calendarType: CalendarDatePicker2Type.single,
                                                // selectableDayPredicate: (day) {
                                                //   final now = DateTime.now();
                                        
                                                //   // Batas minimum: 1 tahun lalu dari hari ini
                                                //   final oneYearAgo = DateTime(now.year - 1, now.month, now.day);
                                        
                                                //   // Disable jika lebih lama dari 1 tahun lalu
                                                //   return day.isAfter(oneYearAgo.subtract(Duration(days: 1)));
                                                // },
                                              ), 
                                              value: dateList,
                                              onValueChanged: (value) {
                                                selectedEndDate = value[0];

                                                endDateController.text = formatDateToIndonesian(value[0]);
                                              },
                                            ),
                                            SizedBox(height: 12,),
                                            ButtonComponent(
                                              onPressed: () {
                                                context.pop();
                                              }, 
                                              label: "Pilih", 
                                              buttonColor: HexColor.fromHex(kPrimaryColor)
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                );
                              }
                            ),
                            SizedBox(height: 18,),
                            NumberTextFieldComponent(
                              label: "Estimasi Hari", 
                              hint: "Estimasi Hari", 
                              controller: estimasiController, 
                              validationMessage: ""
                            ),
                            SizedBox(height: 18,),
                            MainTextComponent(text: "RAB STATUS", fontSize: 14, fontWeight: FontWeight.w500),
                            SizedBox(height: 6,),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black12
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MainTextComponent(
                                    text: "Status", 
                                    fontSize: 14, 
                                    fontWeight: FontWeight.w500
                                  ),
                                  MainTextColorComponent(
                                    color: HexColor.fromHex(kPrimaryColor),
                                    text: "• ON PROCESS", 
                                    fontSize: 16, 
                                    fontWeight: FontWeight.w600
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MainTextComponent(text: "Pengajuan Konstruksi", fontSize: 16, fontWeight: FontWeight.w600),
                        MainTextColorComponent(text: "3 ITEMS TOTAL", fontSize: 14, fontWeight: FontWeight.w500, color: HexColor.fromHex(kSecondaryColor),)
                      ],
                    ),
                    SizedBox(height: 18,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(kSuccessColor).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Icon(LucideIcons.fileText),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "Pengajuan Surat SPMK", fontSize: 16, fontWeight: FontWeight.w600),
                                      SizedBox(height: 2,),
                                      MainTextComponent(text: "Surat Perintah Mulai Kerja", fontSize: 14, fontWeight: FontWeight.w400)
                                    ],
                                  )
                                ),
                              ],
                            ),
                            SizedBox(height: 12,),
                            OutlinedButtonIconComponent(
                              height: 40,
                              onPressed: () {

                              }, 
                              label: "Upload File", 
                              buttonColor: HexColor.fromHex(kPrimaryColor), 
                              icon: LucideIcons.upload600, 
                              labelColor: HexColor.fromHex(kPrimaryColor)
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(kInfoColor).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Icon(LucideIcons.notebookPen),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "Pengajuan RAB", fontSize: 16, fontWeight: FontWeight.w600),
                                      SizedBox(height: 2,),
                                      MainTextComponent(text: "Rencana Anggara Biaya Terperinci", fontSize: 14, fontWeight: FontWeight.w400)
                                    ],
                                  )
                                ),
                              ],
                            ),
                            SizedBox(height: 12,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: MainTextComponent(text: "• Waiting Review", fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 12,),
                                GestureDetector(
                                  onTap: () {}, 
                                  child: Icon(LucideIcons.squarePen, size: 24,)
                                )
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Center(
                                    child: Icon(LucideIcons.calendarDays),
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MainTextComponent(text: "Upload Jadwal Pengerjaan", fontSize: 16, fontWeight: FontWeight.w600),
                                      SizedBox(height: 2,),
                                      MainTextComponent(text: "Format PDF/XLS (Gantt Chart)", fontSize: 14, fontWeight: FontWeight.w400)
                                    ],
                                  )
                                ),
                              ],
                            ),
                            SizedBox(height: 12,),
                            OutlinedButtonIconComponent(
                              height: 40,
                              onPressed: () {

                              }, 
                              label: "Upload File PDF/XLS", 
                              buttonColor: HexColor.fromHex(kPrimaryColor), 
                              icon: LucideIcons.upload600, 
                              labelColor: HexColor.fromHex(kPrimaryColor)
                            )
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
        )
      ),
    );
  }
}