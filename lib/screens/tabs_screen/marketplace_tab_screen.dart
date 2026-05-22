import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lucide_icons_flutter/lucide_icons.dart";
import "package:varindo_estate_management/components/fields/search_textfield_component.dart";
import "package:varindo_estate_management/components/texts/main_text_component.dart";
import "package:varindo_estate_management/screens/varindo/marketplace_tab/marketplace_layanan_estate_tab.dart";
import "package:varindo_estate_management/screens/varindo/marketplace_tab/marketplace_main_tab.dart";
import "package:varindo_estate_management/screens/varindo/marketplace_tab/marketplace_ppob_tab.dart";
import "package:varindo_estate_management/utils/utils.dart";

class MarketplaceTabScreen extends StatefulWidget {

  const MarketplaceTabScreen({ super.key });

  @override
  State<MarketplaceTabScreen> createState() => _MarketplaceTabScreenState();
}

class _MarketplaceTabScreenState extends State<MarketplaceTabScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Padding(
        padding: EdgeInsets.only(top: 18, right: 18, left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor.fromHex(kPrimaryColor).withValues(alpha: 0.4)
                      ),
                      child: Center(
                        child: Icon(LucideIcons.store600),
                      ),
                    ),
                    SizedBox(width: 12,),
                    MainTextComponent(text: "Marketplace", fontSize: 24, fontWeight: FontWeight.w600)
                  ],
                ),
                GestureDetector(
                  child: Icon(LucideIcons.shoppingCart, size: 24,),
                )
              ],
            ),
            SizedBox(height: 24,),
            SearchTextFieldComponent(hint: "Cari kebutuhan warga", controller: searchController, validationMessage: ""),
            SizedBox(height: 24,),
            TabBar(
              onTap: (index) {
        
              },
              indicatorColor: HexColor.fromHex(kPrimaryColor),
              labelStyle: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                color: HexColor.fromHex(kPrimaryColor),
                fontSize: 14
              ),
              unselectedLabelStyle: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                color: HexColor.fromHex(kTextColor),
                fontSize: 14
              ),
              tabs: [
                Tab(
                  text: "Warung Warga",
                ),
                Tab(
                  text: "PPOB (Tagihan)",
                ),
                Tab(
                  text: "Jasa Estate",
                ),
              ],
            ),
            SizedBox(height: 24,),
            Expanded(
              child: TabBarView(
                children: [
                  MarketplaceMainTab(),
                  MarketplacePpobTab(),
                  MarketplaceLayananEstateTab()
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}