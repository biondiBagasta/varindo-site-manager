import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:varindo_estate_management/components/others/adamulti/adamulti_menu_item_component.dart";
import "package:varindo_estate_management/cubit/server_cubit.dart";
import "package:varindo_estate_management/locator.dart";
import "package:varindo_estate_management/model/adamulti/kategori_with_menu_response.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MoreScreenSectionComponent extends StatelessWidget {

  const MoreScreenSectionComponent({ super.key, required this.sectionData });

  final KategoriWithMenuResponse sectionData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final screenWidth = constrains.maxWidth;

        return Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8,),
                    Text(sectionData.kategoridata!.name!, style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    )),
                  ],
                ),
                const SizedBox(height: 6,),
                const Divider(),
                const SizedBox(height: 6,),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  itemCount: sectionData.menulist!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 5,
            
                    // tinggi fix
                    mainAxisExtent: 120,
                  ),
                  itemBuilder: (context, i) {
                    return AdamultiMenuItemComponent(
                      mainContainerWidth: screenWidth * 0.16,
                      containerWidth: screenWidth * 0.14,
                      containerHeight: screenWidth * 0.14,
                      imageWidth: screenWidth * 0.1,
                      imageHeight: screenWidth * 0.1,
                      imageUrl: "${locator.get<ServerCubit>().state.baseUrlAuth}/files/menu-mobile/image/${sectionData.menulist![i].icon!}", 
                      label: sectionData.menulist![i].name!, 
                      onTapAction: () {

                        
                      }, 
                      menuColor: HexColor.fromHex(sectionData.menulist![i].containercolor!),
                      containerBorderRadius: 18,
                    );
                  },
                )
              ],
            ),
          ),
        );
      }
    );
  }
}