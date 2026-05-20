import "package:flutter/material.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/fields/phone_textfield_component.dart";
import "package:varindo_estate_management/components/fields/regular_dropdown_component.dart";
import "package:varindo_estate_management/components/fields/regular_textarea_component.dart";
import "package:varindo_estate_management/components/fields/regular_textfield_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";



class FormPemesananJasaScreen extends StatefulWidget {

  const FormPemesananJasaScreen({ super.key });

  @override
  State<FormPemesananJasaScreen> createState() => _FormPemesananJasaScreenState();
}

class _FormPemesananJasaScreenState extends State<FormPemesananJasaScreen> {

  final namaJasaController = TextEditingController();
  final detailPekerjaanController = TextEditingController();
  final namaPerumahanController = TextEditingController();
  final namaPemilikController = TextEditingController();
  final statusKepemilikanController = TextEditingController();
  final phoneController = TextEditingController();

  final statusKepemilikanList = [
    "Pemilik",
    "Kontrak",
    "Keluarga"
  ];

  @override
  void dispose() {
    namaJasaController.dispose();
    detailPekerjaanController.dispose();
    namaPerumahanController.dispose();
    namaPemilikController.dispose();
    statusKepemilikanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Form Layanan"),
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
                    MainTextComponent(text: "Formulir Pemesanan Jasa", fontSize: 24, fontWeight: FontWeight.w600),
                    SizedBox(height: 6,),
                    MainTextComponent(text: "Lengkapi detail permintaan jasa untuk kenyamanan properti Anda.", fontSize: 14, fontWeight: FontWeight.w400),
                    SizedBox(height: 18,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            RegularTextFieldComponent(
                              label: "Nama Jasa", 
                              hint: "ketik nama jasa", 
                              controller: namaJasaController, 
                              validationMessage: ""
                            ),
                            SizedBox(height: 12,),
                            RegularTextareaComponent(
                              label: "Detail Pekerjaan", 
                              hint: "Ceritakan detail pekerjaan yang dibutuhkan", 
                              controller: detailPekerjaanController, 
                              validationMessage: ""
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18,),
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
                                Icon(LucideIcons.building2Weight600, color: HexColor.fromHex(kPrimaryColor),),
                                SizedBox(width: 6,),
                                MainTextComponent(text: "Informasi Properti", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 8,),
                            RegularTextFieldComponent(
                              label: "Nama Perumahan & Blok", 
                              hint: "e.g. Grand Natura, Blok A.12", 
                              controller: namaPerumahanController, 
                              validationMessage: ""
                            )
                          ],
                        ),
                      ),
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(LucideIcons.contactRound600, color: HexColor.fromHex(kPrimaryColor),),
                                SizedBox(width: 6,),
                                MainTextComponent(text: "Informasi Kontak", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 8,),
                            RegularTextFieldComponent(
                              label: "Nama Pemilik atau Penyewa", 
                              hint: "Ketik nama pemilik atau penyewa", 
                              controller: namaPemilikController, 
                              validationMessage: ""
                            ),
                            SizedBox(height: 12,),
                            RegularDropdownComponent(
                              label: "Status", 
                              hint: "Status Kepemilikan Property", 
                              controller: statusKepemilikanController, 
                              valueList: statusKepemilikanList
                            ),
                            SizedBox(height: 12,),
                            PhoneTextFieldComponent(
                              label: "Nomor Handphone", 
                              hint: "Tanpa prefix +62", 
                              controller: phoneController, 
                              validationMessage: ""
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18,),
                    Card(
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              width: constantScreenWidth,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/layanan.png"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            SizedBox(height: 12,),
                            MainTextColorComponent(text: "Ringkasan Layanan", fontSize: 16, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor),),
                            SizedBox(height: 12,),
                            MainTextComponent(
                              text: "Layanan teknisi profesional kami siap menangani masalah instalasi listrik Anda dengans standar keamanan tinggi di lingkungan Varindo Estate", 
                              fontSize: 14, 
                              fontWeight: FontWeight.w400
                            ),
                            SizedBox(height: 18,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainTextComponent(text: "Estimasi Waktu", fontSize: 14, fontWeight: FontWeight.w500),
                                MainTextColorComponent(text: "1-2 Jam", fontSize: 14, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor))
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainTextComponent(text: "Biaya Kunjungan", fontSize: 14, fontWeight: FontWeight.w500),
                                MainTextColorComponent(text: "Mulai ${FormatCurrency.convertToIdr(50000, 0)}", fontSize: 14, fontWeight: FontWeight.w600, color: HexColor.fromHex(kPrimaryColor))
                              ],
                            ),
                            SizedBox(height: 24,),
                            ButtonComponent(
                              onPressed: () {}, 
                              label: "Pesan Sekarang", 
                              buttonColor: HexColor.fromHex(kPrimaryColor)
                            ),
                            SizedBox(height: 12,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(LucideIcons.shieldCheck, color: HexColor.fromHex(kPrimaryColor)),
                                SizedBox(width: 6,),
                                MainTextComponent(
                                  text: "Jaminan Layanan Aman dan Bergaransi", 
                                  fontSize: 12, 
                                  fontWeight: FontWeight.w400
                                )
                              ],
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