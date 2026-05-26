import "dart:io";
import "package:signature/signature.dart";
import "package:camera/camera.dart";
import "package:dotted_border/dotted_border.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/appbars/custom_appbar_back_light.dart";
import "package:varindo_estate_management/components/buttons/button_component.dart";
import "package:varindo_estate_management/components/buttons/button_icon_component.dart";
import "package:varindo_estate_management/components/camera/camera_back_screen.dart";
import "package:varindo_estate_management/components/camera/show_image_dialog.dart";
import "package:varindo_estate_management/components/fields/regular_textarea_component.dart";
import "package:varindo_estate_management/components/snackbars/show_error_snackbar.dart";
import "package:varindo_estate_management/components/texts/main_text_color_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/components/texts/main_text_dynamic_component.dart";
import "package:varindo_estate_management/cubit/unit_serah_terima_screen_cubit.dart";
import "package:varindo_estate_management/utils/utils.dart";

class UnitSerahTerimaScreen extends StatefulWidget {

  const UnitSerahTerimaScreen({ super.key, required this.unitName });

  final String unitName;

  @override
  State<UnitSerahTerimaScreen> createState() => _UnitSerahTerimaScreenState();
}

class _UnitSerahTerimaScreenState extends State<UnitSerahTerimaScreen> {
  final catatanController = TextEditingController();

  bool selectedSwitch = false;

  late final CameraController _cameraController;

  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.blue,
);

  @override
  void initState() {

    availableCameras().then((cameras) {
      _cameraController = CameraController(
        cameras[0], 
        ResolutionPreset.medium
      );

      // _cameraController.initialize().then((initalize) {
      //   if(context.mounted) {
      //     return;
      //   }
      // }).catchError((Object e) {
      //   if (e is CameraException) {
      //     switch (e.code) {
      //       case 'CameraAccessDenied':
      //         // Handle access errors here.
      //         break;
      //       default:
      //         // Handle other errors here.
      //         break;
      //     }
      //   }
      // });
    });

    super.initState();
  }

  @override
  void dispose() {
    signatureController.dispose();
    _cameraController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  void openCamera() {
    showDialog(
      context: context, 
      builder: (context) {
        return FutureBuilder(
          future: _cameraController.initialize(), 
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError) {
                if(context.mounted) {
                  if (snapshot.error is CameraException) {
                    showErrorSnackBar(context, "ERROR", "Anda harus mengizinkan applikasi untuk mengakses kamera anda.");
                  }
                }

                return const SizedBox();
              } else {
                return CameraBackScreen(
                  cameraController: _cameraController,
                  onTakePicture: () async {
                    final file = await _cameraController.takePicture();
                    
                    final filePath = file.path;

                    if(filePath.isNotEmpty) {
                      final croppedFile = await cropFileFunction(filePath);

                      if(croppedFile != null) {
                        final xFile = XFile(croppedFile.path);
                        addPhoto(File(xFile.path));
                        if(context.mounted) {
                          context.pop();
                        }
                      }
                    }
                  },
                );
              }
            } else {
              return const SizedBox();
            }
          }
        );
      }
    );
  }

  void addPhoto(File fotoFile) {
    final unitSerahTerimaScreenCubit = context.read<UnitSerahTerimaScreenCubit>();

    if(unitSerahTerimaScreenCubit.state.fotoList.length == 10) {
      showErrorSnackBar(context, "ERROR", "Maksimal Foto Komplain Adalah 10");
    } else {
      unitSerahTerimaScreenCubit.addPhoto(fotoFile);
    }
  }

  void removePhoto(int index) {
    final unitSerahTerimaScreenCubit = context.read<UnitSerahTerimaScreenCubit>();

    unitSerahTerimaScreenCubit.deleteFoto(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomLAppbarBackLight(title: "Serah Terima"),
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
                    MainTextComponent(text: widget.unitName, fontSize: 22, fontWeight: FontWeight.w600),
                    SizedBox(height: 4,),
                    MainTextColorComponent(
                      text: "● Tahap : Serah Terima", 
                      fontSize: 16, 
                      fontWeight: FontWeight.w500, 
                      color: HexColor.fromHex(kPrimaryColor)
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
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MainTextComponent(text: "Start Date", fontSize: 12, fontWeight: FontWeight.w400),
                                SizedBox(height: 4,),
                                MainTextComponent(text: "12 Januari 2026", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                width: 2, 
                                color: Colors.grey,
                              )
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MainTextComponent(text: "End Date", fontSize: 12, fontWeight: FontWeight.w400),
                                SizedBox(height: 4,),
                                MainTextComponent(text: "28 Juni 2026", fontSize: 16, fontWeight: FontWeight.w600)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),
                    MainTextComponent(text: "Serah Terima", fontSize: 16, fontWeight: FontWeight.w600),
                    SizedBox(height: 8,),
                    MainTextComponent(text: "UNGGAH FOTO SERAH TERIMA (MAX 10)", fontSize: 14, fontWeight: FontWeight.w400),
                    SizedBox(height: 18,),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              openCamera();
                            },
                            child: DottedBorder(
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
                                      radius: 24,
                                      backgroundColor: Colors.black12,
                                      child: Icon(LucideIcons.camera, size: 36,),
                                    ),
                                    SizedBox(height: 8,),
                                    MainTextComponent(text: "Ambil Foto Komplain", fontSize: 12, fontWeight: FontWeight.w600),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          BlocBuilder<UnitSerahTerimaScreenCubit, UnitSerahTerimaScreenState>(
                            builder: (_, state) {
                              return Row(
                                children: [
                                  for(var i = 0; i < state.fotoList.length; i++) Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showFileImageDialog(context, state.fotoList[i]);
                                        },
                                        child: Stack(
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              height: 120,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(state.fotoList[i])
                                                )
                                              ),
                                            ),
                                            Positioned(
                                              right: -8,
                                              top: -8,
                                              child: GestureDetector(
                                                onTap: () {
                                                  removePhoto(i);
                                                },
                                                child: CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: Colors.black12,
                                                  child: Icon(LucideIcons.x, color: HexColor.fromHex(kErrorColor),),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 12,)
                                    ],
                                  )
                                ],
                              );
                            }
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    MainTextDynamicComponent(
                      maxLines: 1,
                      text: "Minimal 1 foto, maksimal 10 dan pastikan pencahayaannya cukup.", 
                      fontSize: 12, 
                      fontWeight: FontWeight.w500
                    ),
                    SizedBox(height: 24,),
                    RegularTextareaComponent(
                      label: "Catatan Komplain", 
                      hint: "Jelaskan detail komplain anda disini.", 
                      controller: catatanController, 
                      validationMessage: ""
                    ),
                    SizedBox(height: 24,),
                    Card(
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Signature(
                                backgroundColor: Colors.black12,
                                controller: signatureController,
                                width: constantScreenWidth,
                                height: 200,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            ButtonIconComponent(
                              onPressed: () {
                                signatureController.clear();
                              }, 
                              height: 40,
                              label: "Clear Signature", 
                              buttonColor: HexColor.fromHex(kSecondaryColor), 
                              icon: LucideIcons.eraser
                            )
                          ],
                        ),
                      )
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