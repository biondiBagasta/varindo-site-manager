import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:varindo_estate_management/components/carousel/adamulti_carousel.dart";
import "package:varindo_estate_management/components/others/adamulti/more_screen_section_component.dart";
import "package:varindo_estate_management/components/others/adamulti/more_screen_shimmer.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/locator.dart";
import "package:varindo_estate_management/model/adamulti/kategori_with_menu_response.dart";
import "package:varindo_estate_management/services/adamulti_service.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MarketplacePpobTab extends StatelessWidget {

  const MarketplacePpobTab({ super.key });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Card(
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
                            MainTextComponent(text: "ID Pelanggan", fontSize: 14, fontWeight: FontWeight.w400),
                            SizedBox(height: 4,),
                            MainTextComponent(text: "IO0016", fontSize: 14, fontWeight: FontWeight.w600)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MainTextComponent(text: "Saldo", fontSize: 14, fontWeight: FontWeight.w400),
                            SizedBox(height: 4,),
                            MainTextComponent(text: FormatCurrency.convertToIdr(1000000, 0), fontSize: 16, fontWeight: FontWeight.w600)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(Iconsax.empty_wallet_add5, size: 36, color: HexColor.fromHex(kTextColor),),
                ),
              )
            ],
          ),
          SizedBox(height: 24,),
          AdamultiCarousel(),
          SizedBox(height: 24,),
          FutureBuilder<List<KategoriWithMenuResponse>>(
            future: locator.get<AdamultiService>().getAllMenuByKategoriExclude(1, 11, appVersionName),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if(snapshot.data![index].menulist!.isEmpty) {
                      return const SizedBox(height: 0,);
                    } else {
                      return MoreScreenSectionComponent(sectionData: snapshot.data![index]);
                    }
                  }, 
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 18,);
                  }, 
                  itemCount: snapshot.data!.length
                );
              } else {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  itemBuilder: (context, index) {
                    return const MoreScreenShimmer();
                  }, 
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 8,);
                  }, 
                  itemCount: 6
                );
              }
            },
          ),
        ],
      ),
    );
  }
}