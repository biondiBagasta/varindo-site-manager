
import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:varindo_estate_management/utils/utils.dart";

class BeritaComponent extends StatelessWidget {

  const BeritaComponent({ super.key });

  @override
  Widget build(BuildContext context) {
    final titleList = [
      "Varindo Gelar Gathering Estate Manajemen",
      "Tali Air",
      "Rumah Varindo"
    ];

    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {

          },
          child: Card(
            semanticContainer: true,
            surfaceTintColor: HexColor.fromHex(kPrimaryColor),
            elevation: 0.8,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            child: SizedBox(
              width: constantScreenWidth * 0.44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: constantScreenWidth,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/news-${index + 1}.jpg"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                        titleList[index], 
                        maxLines: 2,
                        minFontSize: 2,
                        maxFontSize: 16,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600
                        ),),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }, 
      separatorBuilder: (context, index) {
        return const SizedBox(width: 8,);
      }, 
      itemCount: titleList.length
    );
  }
}