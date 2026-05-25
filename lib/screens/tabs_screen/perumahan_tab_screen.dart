import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:iconsax/iconsax.dart";
import "package:varindo_estate_management/components/fields/search_textfield_component.dart";
import "package:varindo_estate_management/components/others/perumahan_item_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/utils/utils.dart";

class PerumahanTabScreen extends StatefulWidget {

  const PerumahanTabScreen({ super.key });

  @override
  State<PerumahanTabScreen> createState() => _PerumahanTabScreenState();
}

class _PerumahanTabScreenState extends State<PerumahanTabScreen> {

  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18, top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4)
                ),
                child: Center(
                  child: Icon(Iconsax.grid_35),
                ),
              ),
              SizedBox(width: 12,),
              MainTextComponent(text: "Perumahan", fontSize: 24, fontWeight: FontWeight.w600)
            ],
          ),
          SizedBox(height: 24,),
          MainTextComponent(text: "Cari Perumahan", fontSize: 16, fontWeight: FontWeight.w600,),
          SizedBox(height: 8,),
          SearchTextFieldComponent(
            hint: "Ketik nama perumahan", 
            controller: searchController, 
            validationMessage: ""
          ),
          SizedBox(height: 24,),
          MainTextComponent(
            text: "Daftar Perumahan", 
            fontSize: 16, 
            fontWeight: FontWeight.w600,
            isWhite: false,
          ),
          SizedBox(height: 18,),
          Expanded(
            child: ListView(
              children: [
                PerumahanItemComponent(
                  name: "Grand Natura", 
                  location: "Jl. Raya Mataram", 
                  type: "PREMIUM", 
                  totalUnit: 120, 
                  terjual: 95, 
                  onTap: () {
                    context.pushNamed("perumahan-detail", extra: {
                      "perumahanName": "Grand Natura"
                    });
                  }, 
                  image: "https://picture.rumah123.com/r123-images/1080x720-fit/customer/1954025/46837d7dd9b82823bba6acd7588bf6a3.jpg?noWatermark"
                ),
                SizedBox(height: 12,),
                PerumahanItemComponent(
                  name: "Gardenia Raya", 
                  location: "Jl. Gardenia Raya", 
                  type: "RESIDENTICAL", 
                  totalUnit: 120, 
                  terjual: 95, 
                  onTap: () {
                    context.pushNamed("perumahan-detail", extra: {
                      "perumahanName": "Gardenia Raya"
                    });
                  }, 
                  image: "https://varindohome.com/wp-content/uploads/GERBANG-GARDENIA.jpg"
                ),
                SizedBox(height: 12,),
                PerumahanItemComponent(
                  name: "Taman Mandali", 
                  location: "Jl. Raya Mataram", 
                  type: "SUBURBAN", 
                  totalUnit: 120, 
                  terjual: 95, 
                  onTap: () {
                    context.pushNamed("perumahan-detail", extra: {
                      "perumahanName": "Taman Mandali"
                    });
                  }, 
                  image: "https://picture.rumah123.com/r123-images/1080x720-fit/customer/1954025/ba9e59161a3af20e9723d2fbd835357e.jpg?noWatermark"
                ),
                SizedBox(height: 12,),
              ],
            )
          ),
        ],
      ),
    );
  }
}

