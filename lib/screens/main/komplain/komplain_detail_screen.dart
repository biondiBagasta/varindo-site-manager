import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/camera/show_image_dialog.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class KomplainDetailScreen extends StatefulWidget {

  const KomplainDetailScreen({ super.key, required this.siteName, required this.clusterName, required this.homeNumber,
  required this.detailKomplain, required this.image });

  final String siteName;
  final String clusterName;
  final String homeNumber;
  final String detailKomplain;
  final String image;

  @override
  State<KomplainDetailScreen> createState() => _KomplainDetailScreenState();
}

class _KomplainDetailScreenState extends State<KomplainDetailScreen> {

  bool selectedSwitch = false;

  @override
  void initState() {

    
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Detail Komplain"),
      body: SafeArea(
        child: Material(
          color: Colors.white,
          surfaceTintColor: HexColor.fromHex(kPrimaryColor),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MainTextComponent(text: widget.siteName, fontSize: 22, fontWeight: FontWeight.w600),
                              SizedBox(height: 4,),
                              MainTextColorComponent(
                                text: widget.clusterName, 
                                fontSize: 16, 
                                fontWeight: FontWeight.w500, 
                                color: HexColor.fromHex(kPrimaryColor)
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12,),
                        MainTextComponent(text: widget.homeNumber, fontSize: 22, fontWeight: FontWeight.w600)
                      ],
                    ),
                    SizedBox(height: 24,),
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
                                  child: MainTextComponent(text: "FINISH", fontSize: 12, fontWeight: FontWeight.w500),
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
                                    MainTextComponent(text: "100", fontSize: 22, fontWeight: FontWeight.w600),
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
                    MainTextComponent(text: "Foto Komplain", fontSize: 16, fontWeight: FontWeight.w600),
                    SizedBox(height: 18,),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showUrlImageDialog(context, widget.image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                imageUrl: widget.image
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          GestureDetector(
                            onTap: () {
                              showUrlImageDialog(context, widget.image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                imageUrl: widget.image
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          GestureDetector(
                            onTap: () {
                              showUrlImageDialog(context, widget.image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                imageUrl: widget.image
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          GestureDetector(
                            onTap: () {
                              showUrlImageDialog(context, widget.image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                imageUrl: widget.image
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          GestureDetector(
                            onTap: () {
                              showUrlImageDialog(context, widget.image);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                width: 120,
                                height: 120,
                                fit: BoxFit.cover,
                                imageUrl: widget.image
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(text: "Detail Komplain", fontSize: 16, fontWeight: FontWeight.w600),
                    SizedBox(height: 12,),
                    Container(
                      width: constantScreenWidth,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: MainTextComponent(text: widget.detailKomplain, fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(text: "Catatan Penyelesaian", fontSize: 16, fontWeight: FontWeight.w600),
                    SizedBox(height: 12,),
                    Container(
                      width: constantScreenWidth,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: HexColor.fromHex(kInfoColor).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: MainTextComponent(
                        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", 
                        fontSize: 12, 
                        fontWeight: FontWeight.w500
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
                              inactiveThumbColor: Colors.black,
                              inactiveTrackColor: Colors.black12,
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
                      label: "Simpan Komplain", 
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