import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/fields/search_textfield_component.dart";
import "package:varindo_estate_management/components/others/progress_pengerjaan_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class DetailClusterScreen extends StatefulWidget {

  const DetailClusterScreen({ super.key, required this.clusterName, required this.blokName });

  final String clusterName;
  final String blokName;

  @override
  State<DetailClusterScreen> createState() => _DetailClusterScreenState();
}

class _DetailClusterScreenState extends State<DetailClusterScreen> {

  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Detail Cluster"),
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
                      text: widget.clusterName, 
                      fontSize: 22, 
                      fontWeight: FontWeight.w600,
                      color: HexColor.fromHex(kPrimaryColor),
                    ),
                    SizedBox(height: 4,),
                    MainTextComponent(
                      text: widget.blokName, 
                      fontSize: 16, 
                      fontWeight: FontWeight.w400
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(text: "Cari cluster / nomor", fontSize: 14, fontWeight: FontWeight.w500),
                    SizedBox(height: 8,),
                    SearchTextFieldComponent(hint: "Ketik nama cluster / nomor", controller: searchController, validationMessage: ""),
                    SizedBox(height: 18,),
                    ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 64),
                      children: [
                        ProgressPengerjaanItemComponent(
                          image: "https://dinaspupr.bandaacehkota.go.id/wp-content/uploads/sites/59/2020/07/ciri-pondasi-rumah-yang-tidak-kuat-apa-saja-640x381.jpg",
                          blokName: "A-12", 
                          propertiType: "UNIT HUNIAN", 
                          typePengerjaan: "PONDASI", 
                          progressPercent: 25,
                          onTap: () {
                            context.pushNamed("detail-unit-approved", extra: {
                              "unitName": "A-12"
                            });
                          },
                        ),
                        SizedBox(height: 12,),
                        ProgressPengerjaanItemComponent(
                          image: "https://chinasteelbuildsales.com/wp-content/uploads/2025/09/Steel-Web-Truss-Building1.webp",
                          blokName: "A-14", 
                          propertiType: "UNIT HUNIAN", 
                          typePengerjaan: "RANGKA", 
                          progressPercent: 55,
                          onTap: () {
                            context.pushNamed("detail-unit-approved", extra: {
                              "unitName": "A-12"
                            });
                          },
                        ),
                        SizedBox(height: 12,),
                        ProgressPengerjaanItemComponent(
                          image: "https://www.gardaoto.com/wp-content/uploads/2022/04/jenis-Jenis-Atap-Rumah-Berdasarkan-Bahan-Materialnya.jpg",
                          blokName: "B-02", 
                          propertiType: "UNIT HUNIAN", 
                          typePengerjaan: "SELESAI", 
                          progressPercent: 100,
                          onTap: () {
                            context.pushNamed("unit-serah-terima", extra: {
                              "unitName": "B-02"
                            });
                          },
                        ),
                        SizedBox(height: 12,),
                        ProgressPengerjaanItemComponent(
                          image: "https://inkontraktor.com/wp-content/uploads/2023/04/inspirasi-model-atap-rumah-1024x576.webp",
                          blokName: "E-05", 
                          propertiType: "UNIT HUNIAN", 
                          typePengerjaan: "TERSEDIA", 
                          progressPercent: 0,
                          onTap: () {
                            context.pushNamed("pengajuan-spmk", extra: {
                              "unitName": "E-05"
                            });
                          },
                        ),
                        SizedBox(height: 12,),
                      ],
                    ),
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